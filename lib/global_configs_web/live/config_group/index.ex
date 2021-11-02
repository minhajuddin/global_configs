defmodule GlobalConfigsWeb.ConfigGroupLive.Index do
  use GlobalConfigsWeb, :live_view

  alias GlobalConfigs.Core

  def mount(_params, _session, socket) do
    {:ok, assign(socket, groups: Core.list_groups("*"))}
  end

  def handle_event("filter-group", %{"env" => env}, socket) do
    {:noreply, assign(socket, groups: Core.list_groups(env))}
  end
end
