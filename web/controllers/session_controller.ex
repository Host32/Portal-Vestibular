defmodule PortalVestibular.SessionController do
  use PortalVestibular.Web, :controller

  def new(conn, _params) do
    render conn, "new.html"
  end

  def create(conn, %{"session" => session_params}) do
    case PortalVestibular.Session.login(session_params, PortalVestibular.Repo) do
      {:ok, user} ->
        conn
        |> put_session(:current_user, user)
        |> put_flash(:info, "Logged In")
        |> redirect(to: "/")
      :error ->
        conn
        |> put_flash(:error, "Wrong email or password")
        |> render("new.html")
    end
  end

  def delete(conn, _) do
    conn
    |> delete_session(:current_user)
    |> put_flash(:info, "Logged out")
    |> redirect(to: "/")
  end
end
