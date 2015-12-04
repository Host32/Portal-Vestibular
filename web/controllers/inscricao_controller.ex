defmodule PortalVestibular.InscricaoController do
  use PortalVestibular.Web, :controller

  alias PortalVestibular.Inscricao
  alias PortalVestibular.Curso

  plug :scrub_params, "inscricao" when action in [:create, :update]

  def index(conn, _params) do
    inscricoes = Repo.all(Inscricao)
    render(conn, "index.html", inscricoes: inscricoes)
  end

  def new(conn, _params) do
    changeset = Inscricao.changeset(%Inscricao{})
    cursos = Repo.all(Curso)
    render(conn, "new.html", changeset: changeset, cursos: cursos)
  end

  def create(conn, %{"inscricao" => inscricao_params}) do
    changeset = Inscricao.changeset(%Inscricao{}, inscricao_params)

    case Repo.insert(changeset) do
      {:ok, _inscricao} ->
        conn
        |> put_flash(:info, "Inscricao created successfully.")
        |> redirect(to: inscricao_path(conn, :success))
      {:error, changeset} ->
        cursos = Repo.all(Curso)
        render(conn, "new.html", changeset: changeset, cursos: cursos)
    end
  end

  def show(conn, %{"id" => id}) do
    inscricao = Repo.get!(Inscricao, id)
    render(conn, "show.html", inscricao: inscricao)
  end

  def edit(conn, %{"id" => id}) do
    inscricao = Repo.get!(Inscricao, id)
    changeset = Inscricao.changeset(inscricao)
    cursos = Repo.all(Curso)
    render(conn, "edit.html", inscricao: inscricao, changeset: changeset, cursos: cursos)
  end

  def success(conn, _params) do
    render(conn, "success.html")
  end

  def pesquisar(conn, %{"cpf" => cpf}) do
    [inscricao|_] = from(i in Inscricao, where: i.cpf == ^cpf)
      |> Repo.all
    render(conn, "show.html", inscricao: inscricao)
  end

  def pesquisar(conn, _params) do
    render(conn, "pesquisar.html")
  end

  def update(conn, %{"id" => id, "inscricao" => inscricao_params}) do
    inscricao = Repo.get!(Inscricao, id)
    changeset = Inscricao.changeset(inscricao, inscricao_params)

    case Repo.update(changeset) do
      {:ok, inscricao} ->
        conn
        |> put_flash(:info, "Inscricao updated successfully.")
        |> redirect(to: inscricao_path(conn, :show, inscricao))
      {:error, changeset} ->
        cursos = Repo.all(Curso)
        render(conn, "edit.html", inscricao: inscricao, changeset: changeset, cursos: cursos)
    end
  end

  def delete(conn, %{"id" => id}) do
    inscricao = Repo.get!(Inscricao, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(inscricao)

    conn
    |> put_flash(:info, "Inscricao deleted successfully.")
    |> redirect(to: inscricao_path(conn, :index))
  end
end
