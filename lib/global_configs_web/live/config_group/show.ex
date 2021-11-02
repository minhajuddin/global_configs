defmodule GlobalConfigsWeb.ConfigGroupLive.Show do
  use GlobalConfigsWeb, :live_view

  alias GlobalConfigs.Core
  require Logger

  def mount(params, _session, socket) do
    Logger.info(params: params)
    {:ok, assign(socket, group: Core.find_group(params["id"]))}
  end

  def handle_event("filter-group", %{"env" => env}, socket) do
    {:noreply, assign(socket, groups: Core.list_groups(env))}
  end
end
