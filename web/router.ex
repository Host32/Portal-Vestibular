defmodule PortalVestibular.Router do
  use PortalVestibular.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", PortalVestibular do
    pipe_through :browser # Use the default browser stack

    get "/", PrincipalController, :index
    resources "/cursos", CursoController

    get "/inscricoes/success", InscricaoController, :success
    get "/inscricoes/pesquisar", InscricaoController, :pesquisar
    resources "/inscricoes", InscricaoController
  end

  # Other scopes may use custom stacks.
  # scope "/api", PortalVestibular do
  #   pipe_through :api
  # end
end
