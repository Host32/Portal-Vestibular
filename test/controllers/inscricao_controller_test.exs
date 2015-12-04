defmodule PortalVestibular.InscricaoControllerTest do
  use PortalVestibular.ConnCase

  alias PortalVestibular.Inscricao
  @valid_attrs %{celular: "some content", cpf: "some content", email: "some content", endereco: "some content", nome: "some content", telefone: "some content"}
  @invalid_attrs %{}

  setup do
    conn = conn()
    {:ok, conn: conn}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, inscricao_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing inscricoes"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, inscricao_path(conn, :new)
    assert html_response(conn, 200) =~ "New inscricao"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, inscricao_path(conn, :create), inscricao: @valid_attrs
    assert redirected_to(conn) == inscricao_path(conn, :index)
    assert Repo.get_by(Inscricao, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, inscricao_path(conn, :create), inscricao: @invalid_attrs
    assert html_response(conn, 200) =~ "New inscricao"
  end

  test "shows chosen resource", %{conn: conn} do
    inscricao = Repo.insert! %Inscricao{}
    conn = get conn, inscricao_path(conn, :show, inscricao)
    assert html_response(conn, 200) =~ "Show inscricao"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_raise Ecto.NoResultsError, fn ->
      get conn, inscricao_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    inscricao = Repo.insert! %Inscricao{}
    conn = get conn, inscricao_path(conn, :edit, inscricao)
    assert html_response(conn, 200) =~ "Edit inscricao"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    inscricao = Repo.insert! %Inscricao{}
    conn = put conn, inscricao_path(conn, :update, inscricao), inscricao: @valid_attrs
    assert redirected_to(conn) == inscricao_path(conn, :show, inscricao)
    assert Repo.get_by(Inscricao, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    inscricao = Repo.insert! %Inscricao{}
    conn = put conn, inscricao_path(conn, :update, inscricao), inscricao: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit inscricao"
  end

  test "deletes chosen resource", %{conn: conn} do
    inscricao = Repo.insert! %Inscricao{}
    conn = delete conn, inscricao_path(conn, :delete, inscricao)
    assert redirected_to(conn) == inscricao_path(conn, :index)
    refute Repo.get(Inscricao, inscricao.id)
  end
end
