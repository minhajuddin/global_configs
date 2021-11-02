# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     GlobalConfigs.Repo.insert!(%GlobalConfigs.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias GlobalConfigs.Repo
alias GlobalConfigs.Core.Config
alias GlobalConfigs.Core.ConfigGroup

now = NaiveDateTime.utc_now() |> NaiveDateTime.truncate(:second)

Repo.insert_all(ConfigGroup, [
  %{name: "liveform", env: "prod", notes: "Liveform configs", inserted_at: now, updated_at: now},
  %{name: "liveform", env: "dev", notes: "Liveform configs", inserted_at: now, updated_at: now},
  %{
    name: "simpleform",
    env: "prod",
    notes: "Liveform configs",
    inserted_at: now,
    updated_at: now
  },
  %{name: "simpleform", env: "dev", notes: "Liveform configs", inserted_at: now, updated_at: now}
])

group = Repo.get_by(ConfigGroup, name: "liveform", env: "prod")

Repo.insert_all(Config, [
  %{
    name: "db_url",
    value: "postgres://un@pw:localhost",
    notes: "DB connection string",
    inserted_at: now,
    updated_at: now,
    config_group_id: group.id
  },
  %{
    name: "crm_url",
    value: "https://github.com",
    notes: "CRM url",
    inserted_at: now,
    updated_at: now,
    config_group_id: group.id
  }
])
