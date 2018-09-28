# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :cms,
  ecto_repos: [Cms.Repo]

# Configures the endpoint
config :cms, CmsWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "qqb9LRArbAWUeMu0TIzAuR+EbrrzpvXvwIDgfMKIvT1ZyFQymmpUkRpuDGSDD+nX",
  render_errors: [view: CmsWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Cms.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

# Guardian
config :cms, Cms.Auth.Guardian,
  issuer: "CMS",
  secret_key: "HNinpKh9NE3tr8BPJCpAEh0xzCqTIG3PWsfkR2AtzvUaRIpbs6oIQ9RcmjmGPekJ"

# Arc Image Upload
config :arc,
  storage: Arc.Storage.Local
