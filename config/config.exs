use Mix.Config

config :phoenix, :json_library, Jason
config :phoenix, :stacktrace_depth, 20

config :logger, level: :warn
config :logger, :console, format: "[$level] $message\n"

config :surface, :catalogue, extra_catalogues: [
  Surface.Catalogue,
  Surface.Examples.Catalogue
]
