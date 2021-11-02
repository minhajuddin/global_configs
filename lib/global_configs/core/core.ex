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
end
