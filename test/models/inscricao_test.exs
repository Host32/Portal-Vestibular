defmodule PortalVestibular.InscricaoTest do
  use PortalVestibular.ModelCase

  alias PortalVestibular.Inscricao

  @valid_attrs %{celular: "some content", cpf: "some content", email: "some content", endereco: "some content", nome: "some content", telefone: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Inscricao.changeset(%Inscricao{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Inscricao.changeset(%Inscricao{}, @invalid_attrs)
    refute changeset.valid?
  end
end
