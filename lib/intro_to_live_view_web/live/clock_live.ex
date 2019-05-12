defmodule IntroToLiveViewWeb.ClockLive do
  use Phoenix.LiveView

  @tick_millis 1000

  def render(assigns) do
    ~L"""
    <div>
      <div class="controls">
        <form phx-change="update_settings">
          <input type="range" min="10" max="1000" name="tick" value="<%= @tick %>" />
          <%= @tick %>ms
        </form>
      </div>
      <h2><%= @current_time %></h2>
    </div>
    """
  end

  def mount(_session, socket) do
    if connected?(socket) do
      Process.send_after(self(), :tick, @tick_millis)
    end

    {:ok, assign(update_time(socket), tick: @tick_millis)}
  end

  def handle_info(:tick, socket) do
    Process.send_after(self(), :tick, socket.assigns.tick)
    {:noreply, update_time(socket)}
  end

  def handle_event("update_settings", %{"tick" => tick}, socket) do
    {:noreply, assign(socket, tick: String.to_integer(tick))}
  end

  defp update_time(socket) do
    assign(socket, current_time: DateTime.utc_now())
  end
end
