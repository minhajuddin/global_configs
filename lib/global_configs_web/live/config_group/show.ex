defmodule GlobalConfigsWeb.ConfigGroupLive.Show do
  use GlobalConfigsWeb, :live_view

  alias GlobalConfigs.Core
  require Logger

  def mount(params, _session, socket) do
    {:ok,
     assign(socket,
       group: Core.find_group(params["id"]),
       configs: Core.list_configs(params["id"]),
       show_form: true
     )}
  end

  def handle_event("filter-config", %{"q" => query}, socket) do
    {:noreply, assign(socket, configs: Core.list_configs(socket.assigns.group.id, query))}
  end

  def handle_event("save", config_params, socket) do
    group = socket.assigns.group
    Core.create_config(group, config_params)
    {:noreply, assign(socket, configs: Core.list_configs(group.id))}
  end
end
