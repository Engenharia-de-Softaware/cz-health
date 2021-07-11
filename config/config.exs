# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :cz_health,
  ecto_repos: [CzHealth.Repo]

# Configures the endpoint
config :cz_health, CzHealthWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "dYJxmA1tGJjaOweUIw9sHRuqdNWo+WIKCUnS8cJu3XfncrHnwqSwxvDnY1WpD04K",
  render_errors: [view: CzHealthWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: CzHealth.PubSub,
  live_view: [signing_salt: "SDlOMdSM"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
