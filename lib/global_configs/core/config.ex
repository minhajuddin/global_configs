defmodule GlobalConfigs.Core.Config do
  use Ecto.Schema
  import Ecto.Changeset

  schema "configs" do
    field :name, :string
    field :notes, :string
    field :value, :string
    field :config_group_id, :id

    timestamps()
  end

  @doc false
  def changeset(config, attrs) do
    config
    |> cast(attrs, [:name, :value, :notes])
    |> validate_required([:name, :value, :notes])
  end
end
