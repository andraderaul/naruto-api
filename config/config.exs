# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :naruto_api,
  ecto_repos: [NarutoApi.Repo]

# Configures the endpoint
config :naruto_api, NarutoApiWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "H71gsSaPR4jpFaFO9IhQxOCtdQNkL5yPlIYVbA9h0DBH41d7ihdzCD95H8S1a367",
  render_errors: [view: NarutoApiWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: NarutoApi.PubSub,
  live_view: [signing_salt: "hsQ2R3Ha"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
