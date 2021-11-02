defmodule GlobalConfigs.Repo.Migrations.CreateConfigs do
  use Ecto.Migration

  def change do
    create table(:configs) do
      add :name, :string, null: false
      add :value, :text
      add :notes, :text
      add :config_group_id, references(:config_groups, on_delete: :nothing)

      timestamps()
    end

    create index(:configs, [:config_group_id, :name], unique: true)
  end
end
