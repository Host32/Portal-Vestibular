defmodule PortalVestibular.CursoTest do
  use PortalVestibular.ModelCase

  alias PortalVestibular.Curso

  @valid_attrs %{descricao: "some content", duracao: 42, nome: "some content", periodo: "some content", valor: "120.5"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Curso.changeset(%Curso{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Curso.changeset(%Curso{}, @invalid_attrs)
    refute changeset.valid?
  end
end
