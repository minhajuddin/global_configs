defmodule GlobalConfigsWeb.PageController do
  use GlobalConfigsWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
