defmodule PortalVestibular.CursoControllerTest do
  use PortalVestibular.ConnCase

  alias PortalVestibular.Curso
  @valid_attrs %{descricao: "some content", duracao: 42, nome: "some content", periodo: "some content", valor: "120.5"}
  @invalid_attrs %{}

  setup do
    conn = conn()
    {:ok, conn: conn}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, curso_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing cursos"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, curso_path(conn, :new)
    assert html_response(conn, 200) =~ "New curso"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, curso_path(conn, :create), curso: @valid_attrs
    assert redirected_to(conn) == curso_path(conn, :index)
    assert Repo.get_by(Curso, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, curso_path(conn, :create), curso: @invalid_attrs
    assert html_response(conn, 200) =~ "New curso"
  end

  test "shows chosen resource", %{conn: conn} do
    curso = Repo.insert! %Curso{}
    conn = get conn, curso_path(conn, :show, curso)
    assert html_response(conn, 200) =~ "Show curso"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_raise Ecto.NoResultsError, fn ->
      get conn, curso_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    curso = Repo.insert! %Curso{}
    conn = get conn, curso_path(conn, :edit, curso)
    assert html_response(conn, 200) =~ "Edit curso"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    curso = Repo.insert! %Curso{}
    conn = put conn, curso_path(conn, :update, curso), curso: @valid_attrs
    assert redirected_to(conn) == curso_path(conn, :show, curso)
    assert Repo.get_by(Curso, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    curso = Repo.insert! %Curso{}
    conn = put conn, curso_path(conn, :update, curso), curso: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit curso"
  end

  test "deletes chosen resource", %{conn: conn} do
    curso = Repo.insert! %Curso{}
    conn = delete conn, curso_path(conn, :delete, curso)
    assert redirected_to(conn) == curso_path(conn, :index)
    refute Repo.get(Curso, curso.id)
  end
end
