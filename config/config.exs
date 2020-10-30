# in config.exs
use Mix.Config

config :crawly,
  closespider_timeout: 2,
  concurrent_requests_per_domain: 1,
  middlewares: [
    Crawly.Middlewares.DomainFilter,
    Crawly.Middlewares.UniqueRequest,
    {Crawly.Middlewares.UserAgent, user_agents: ["Crawly Bot"]}
  ],
  pipelines: [
    {Crawly.Pipelines.Validate, fields: [:url, :title]},
    {Crawly.Pipelines.DuplicatesFilter, item_id: :title},
    Crawly.Pipelines.JSONEncoder,
    {Crawly.Pipelines.WriteToFile, extension: "jl", folder: "/tmp"}
  ],
  fetcher: {Crawly.Fetchers.Splash, [base_url: "http://localhost:8050/render.html"]}
