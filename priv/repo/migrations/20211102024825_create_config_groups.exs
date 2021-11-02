defmodule GlobalConfigs.Repo.Migrations.CreateConfigGroups do
  use Ecto.Migration

  def change do
    create table(:config_groups) do
      add :name, :string, null: false
      add :env, :string, null: false
      add :notes, :text

      timestamps()
    end
  end
end
