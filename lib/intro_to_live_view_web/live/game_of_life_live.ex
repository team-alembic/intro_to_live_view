defmodule IntroToLiveViewWeb.GameOfLifeLive do
  use Phoenix.LiveView

  def render(assigns) do
    x_offset = div(assigns.width, 2)
    y_offset = div(assigns.height, 2)
    size = 6
    border_width = 1
    half_size = div(size, 2)
    # border = half_size - border_width

    ~L"""
    <svg viewBox="-0.5 -0.5 <%= @width * size - 2 %> <%= @height * size - 2 %>">
      <g transform="translate(<%= size %>, <%= size %>)">
        <g>
          <%= for {x, y} <- @world do %>
            <path
              fill="#444"
              phx-click="toggle"
              phx-value="<%= "#{x},#{y}" %>"
              transform="translate(<%= (x + x_offset) * size %>, <%= (y + y_offset) * size %>)"
              d="M -3,-3 L -3,2.75 L 2.75,2.75 L 2.75,-3 Z"
            />
          <% end %>
        </g>
      </g>
    </svg>
    <div class="controls">
      <form phx-change="update_settings">
        <button <%= @active && "disabled" %> phx-click="clear">Clear</button>
        <button <%= @active && "disabled" %> phx-click="start">Start</button>
        <button <%= !@active && "disabled" %> phx-click="stop">Stop</button>
        <button <%= @active && "disabled" %> phx-click="step">Step</button>
        <input type="range" step="10" min="50" max="5000" name="tick" value="<%= @tick %>" />
        <%= @tick %>ms
      </form>
    </div>
    """
  end

  def mount(_session, socket) do
    if connected?(socket) do
    end

    {:ok, clear(socket)}
  end

  def handle_info(:tick, socket) do
    if socket.assigns.active do
      Process.send_after(self(), :tick, socket.assigns.tick)
    end

    {:noreply, step(socket)}
  end

  def handle_event("clear", _, socket) do
    {:noreply, clear(socket)}
  end

  def handle_event("start", _, socket) do
    Process.send_after(self(), :tick, socket.assigns.tick)
    {:noreply, assign(socket, active: true)}
  end

  def handle_event("stop", _, socket) do
    {:noreply, assign(socket, active: false)}
  end

  def handle_event("step", _, socket) do
    {:noreply, step(socket)}
  end

  def handle_event("toggle", coords, socket) do
    [x, y] = String.split(coords, ",") |> Enum.map(&String.to_integer/1)
    {:noreply, assign(socket, world: GameOfLife.toggle(socket.assigns.world, {x, y}))}
  end

  def handle_event("update_settings", %{"tick" => tick}, socket) do
    {:noreply, assign(socket, tick: String.to_integer(tick))}
  end

  def clear(socket) do
    assign(socket,
      world: GameOfLife.ten_cell_row(),
      active: false,
      tick: 100,
      width: 56,
      height: 38
    )
  end

  def step(socket) do
    assign(socket, world: GameOfLife.tick(socket.assigns.world))
  end
end
