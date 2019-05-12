defmodule IntroToLiveViewWeb.CounterLive do
  use Phoenix.LiveView

  def render(assigns) do
    ~L"""
    <div>
      <h1><%= @value %></h1>
      <button phx-click="down">-</button>
      <button phx-click="up">+</button>
    </div>
    """
  end

  def mount(_session, socket) do
    {:ok, assign(socket, value: 0)}
  end

  def handle_event("up", _, socket) do
    {:noreply, update(socket, :value, &(&1 + 1))}
  end

  def handle_event("down", _, socket) do
    {:noreply, update(socket, :value, &(&1 - 1))}
  end
end
