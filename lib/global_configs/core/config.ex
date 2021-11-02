defmodule GlobalConfigs.Core.Config do
  use Ecto.Schema
  import Ecto.Changeset

  schema "configs" do
    field :name, :string, null: false
    field :value, :string
    field :notes, :string
    field :config_group_id, :id

    timestamps()
  end

  @doc false
  def changeset(config, attrs) do
    config
    |> cast(attrs, [:name, :value, :notes, :config_group_id])
    |> validate_required([:name, :value])
  end
end
