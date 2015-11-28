defmodule PortalVestibular.CursoController do
  use PortalVestibular.Web, :controller

  alias PortalVestibular.Curso

  plug :scrub_params, "curso" when action in [:create, :update]

  def index(conn, _params) do
    cursos = Repo.all(Curso)
    render(conn, "index.html", cursos: cursos)
  end

  def new(conn, _params) do
    changeset = Curso.changeset(%Curso{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"curso" => curso_params}) do
    changeset = Curso.changeset(%Curso{}, curso_params)

    case Repo.insert(changeset) do
      {:ok, _curso} ->
        conn
        |> put_flash(:info, "Curso created successfully.")
        |> redirect(to: curso_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    curso = Repo.get!(Curso, id)
    render(conn, "show.html", curso: curso)
  end

  def edit(conn, %{"id" => id}) do
    curso = Repo.get!(Curso, id)
    changeset = Curso.changeset(curso)
    render(conn, "edit.html", curso: curso, changeset: changeset)
  end

  def update(conn, %{"id" => id, "curso" => curso_params}) do
    curso = Repo.get!(Curso, id)
    changeset = Curso.changeset(curso, curso_params)

    case Repo.update(changeset) do
      {:ok, curso} ->
        conn
        |> put_flash(:info, "Curso updated successfully.")
        |> redirect(to: curso_path(conn, :show, curso))
      {:error, changeset} ->
        render(conn, "edit.html", curso: curso, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    curso = Repo.get!(Curso, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(curso)

    conn
    |> put_flash(:info, "Curso deleted successfully.")
    |> redirect(to: curso_path(conn, :index))
  end
end
