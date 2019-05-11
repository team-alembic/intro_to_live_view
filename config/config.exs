# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

# Configures the endpoint
config :intro_to_live_view, IntroToLiveViewWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "o1FJsuhLlzKkFuFrRsn7phUW9esE98R2exj253HiaykSGHPBad28OpJFHZzsDHHt",
  render_errors: [view: IntroToLiveViewWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: IntroToLiveView.PubSub, adapter: Phoenix.PubSub.PG2],
  live_view: [
     signing_salt: "nRxDgwXCdT77xemBNKyLmEhXwm9snMI2"
   ]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
