defmodule GlobalConfigs.Repo do
  use Ecto.Repo,
    otp_app: :global_configs,
    adapter: Ecto.Adapters.Postgres
end
