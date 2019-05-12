defmodule IntroToLiveViewWeb.SearchLive do
  use Phoenix.LiveView

  def render(assigns) do
    ~L"""
    <form phx-change="suggest" phx-submit="search">
      <input type="text" name="q" value="<%= @query %>" list="matches" placeholder="Search..."
             <%= if @loading, do: "readonly" %>/>
      <datalist id="matches">
        <%= for match <- @matches do %>
          <option value="<%= match %>"><%= match %></option>
        <% end %>
      </datalist>
      <%= if @result do %><pre><%= @result %></pre><% end %>
    </form>
    """
  end

  def mount(_session, socket) do
    dict =
      "priv/sowpods.txt"
      |> File.read!()
      |> String.split("\n")
      |> Enum.take(1000)
      |> Enum.map(&String.downcase/1)

    {:ok, assign(socket, dict: dict, query: nil, result: nil, loading: false, matches: [])}
  end

  def handle_event("suggest", %{"q" => query}, socket) when byte_size(query) <= 100 do
    matches =
      Enum.filter(socket.assigns.dict, fn word -> String.contains?(word, String.downcase(query)) end)
      |> Enum.take(10)

    {:noreply, assign(socket, matches: matches)}
  end

  def handle_event("search", %{"q" => query}, socket) when byte_size(query) <= 100 do
    send(self(), {:search, query})
    {:noreply, assign(socket, query: query, result: "Searching...", loading: true, matches: [])}
  end

  def handle_info({:search, query}, socket) do
    result =
      Enum.find(socket.assigns.dict, fn word -> word == String.downcase(query) end)
    {:noreply, assign(socket, loading: false, result: result, matches: [])}
  end
end
