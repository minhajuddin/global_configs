defmodule GlobalConfigs.Core do
  alias GlobalConfigs.Repo
  alias GlobalConfigs.Core.ConfigGroup
  alias GlobalConfigs.Core.Config

  import Ecto.Query

  # TODO: add pagination
  def list_groups(env) do
    query = from(g in ConfigGroup)

    query =
      if env == "*" do
        query
      else
        from q in query, where: q.env == ^env
      end

    Repo.all(query)
  end

  def find_group(id) do
    Repo.get(ConfigGroup, id)
  end

  def list_configs(config_group_id, search \\ "") do
    query = from c in Config, where: c.config_group_id == ^config_group_id

    query =
      if search == "%%" do
        query
      else
        search = "%#{search}%"
        from q in query, where: fragment("? ILIKE  ?", q.name, ^search)
      end

    Repo.all(query)
  end

  def create_config(group, config_params) do
    Repo.insert(
      Config.changeset(
        %Config{},
        Map.merge(config_params, %{"config_group_id" => group.id})
      )
    )
  end
end
