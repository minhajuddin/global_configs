defmodule GlobalConfigs.Core.ConfigGroup do
  use Ecto.Schema
  import Ecto.Changeset

  schema "config_groups" do
    field :name, :string, null: false
    field :env, :string, null: false
    field :notes, :string

    timestamps()
  end

  @doc false
  def changeset(config_group, attrs) do
    config_group
    |> cast(attrs, [:name, :env])
    |> validate_required([:name, :env])
  end
end
