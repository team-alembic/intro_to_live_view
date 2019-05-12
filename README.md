# Intro To Phoenix LiveView

## Starting the Server

To start your Phoenix server:

- Install dependencies with `mix deps.get`
- Install JS dependencies with `npm install --prefix assets`
- Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

## Learn more about Phoenix

- Official website: http://www.phoenixframework.org/
- Guides: https://hexdocs.pm/phoenix/overview.html
- Docs: https://hexdocs.pm/phoenix
- Mailing list: http://groups.google.com/group/phoenix-talk
- Source: https://github.com/phoenixframework/phoenix

## Learn more about Phoenix LiveView

The LiveView repo lives here:

https://github.com/phoenixframework/phoenix_live_view

Some great examples are collected here:

https://github.com/chrismccord/phoenix_live_view_example

## Exercises

If you get stuck there is a branch in this repo called `answers`.

### 1. A Simple Clock

Create `lib/intro_to_live_view_web/live` folder.

Create file `lib/intro_to_live_view_web/live/clock_live.ex` containing:

    defmodule IntroToLiveViewWeb.ClockLive do
      use Phoenix.LiveView
    end

Now add a `render/1` function to our ClockLive module to render the HTML DOM element.

`~L` is a special live view sigil which allows DOM diffing to take place. `@current_time` is extracted from the assigns Map.

    def render(assigns) do
      ~L"""
      <h1><%= @current_time %></h1>
      """
    end

Add a `mount/2` function to the same file. This gets called when the view is first loaded. We need to set the `current_time` field on the socket map here so let's make a function for that. (We'll need it again when we update the time on a tick of the clock).

    def mount(_session, socket) do
      {:ok, update_time(socket)}
    end

    defp update_time(socket) do
      assign(socket, current_time: DateTime.utc_now())
    end

That should be enough to show a clock so let's wire it up to the home page.

Add this somewhere in `lib/intro_to_live_view_web/templates/page/index.html.eex`

    <%= live_render(@conn, IntroToLiveViewWeb.ClockLive) %>

Go to http://localhost:4000

You should see the current time and you can refresh to update the time.

#### Let's make it LIVE!

On loading the component let's fire off a clock `:tick` event to be received in 1000ms.

Add this to the start of your `mount/2` function:

    if connected?(socket) do
      Process.send_after(self(), :tick, 1000)
    end

Unless we handle that message then we'll see errors, so add this function to handle the tick and update the `current_time` field with the `update_time` function we wrote earlier. We also need to fire off the next tick by sending ourselves another `:tick` message.

    def handle_info(:tick, socket) do
      Process.send_after(self(), :tick, 1000)
      {:noreply, update_time(socket)}
    end

Refresh the page and you should see the clock change every second.

How fast can the clock change?

### 2. Interactive Counter

Make another Live View Module inside the same `/live` folder called `counter_live.ex` with the same structure. Copy the previous file if you like but be careful to change the module name to `CounterLive` and remove all the functions from it.

Use this render function:

    def render(assigns) do
      ~L"""
      <div>
        <h1>Count: <%= @value %></h1>
        <button phx-click="down">-</button>
        <button phx-click="up">+</button>
      </div>
      """
    end

And set the initial value to 0:

    def mount(_session, socket) do
      {:ok, assign(socket, :value, 0)}
    end

Render this new view the same way we did before in `lib/intro_to_live_view_web/templates/page/index.html.eex`:

    <section class="phx-hero">
      <%= live_render(@conn, IntroToLiveViewWeb.CounterLive) %>
    </section>

The `phx-click` attributes in the buttons send a named message to our server which we can handle with a `handle_event`. We ignore the second argument because there is no value, just an event name.

    def handle_event("up", _, socket) do
      {:noreply, update(socket, :value, &(&1 + 1))}
    end

    def handle_event("down", _, socket) do
      {:noreply, update(socket, :value, &(&1 - 1))}
    end

### 3. Add some interactivity to the clock

Add a way of controlling the speed of Clock updates by sending ticks at different time intervals. You can start by adding this template:

    <div class="controls">
      <form phx-change="update_settings">
        <input type="range" min="10" max="5000" name="tick" value="<%= @tick %>" />
        <%= @tick %>ms
      </form>
    </div>

You'll need to handle the `update_settings` event yourself.

### 4. Build an autocompleting text field

Build a form field that searches a list of words using this template.

    ~L"""
    <form phx-change="suggest" phx-submit="search">
      <input type="text" name="q" value="<%= @query %>" list="matches" placeholder="Search words" />
      <datalist id="matches">
        <%= for match <- @matches do %>
          <option value="<%= match %>"><%= match %></option>
        <% end %>
      </datalist>
      <%= if @result do %><pre><%= @result %></pre><% end %>
    </form>
    """

You'll need to handle the `suggest` (on change) and `search` (on submit) events. They both send a map containing the form fields `%{"q" => query}`. So you can pattern match that value.

You'll need to track `query` (the search query), `matches` (any suggestions) and a `result` if the query is found.

There is a scrabble dictionary included which you could read in with this snippet:

    dict =
      "priv/sowpods.txt"
      |> File.read!()
      |> String.split("\n")
      |> Enum.take(1000) # there are 250k so limit it
      |> Enum.map(&String.downcase/1) # words are capitalised

## Next Steps

If you're done playing with these simple examples then try:

1. Take a look at the examples in https://github.com/chrismccord/phoenix_live_view_example. Clone the repo and follow the instructions to get it running to play around with some more complex examples.

2. Start looking at https://github.com/team-alembic/lambdajam-blast which has an advanced multiplayer game. There are some more task ideas in that repo.
