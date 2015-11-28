defmodule PortalVestibular.PrincipalController do
  use PortalVestibular.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
