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

now = NaiveDateTime.utc_now() |> NaiveDateTime.truncate(:second)

GlobalConfigs.Repo.insert_all(GlobalConfigs.Core.ConfigGroup, [
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
