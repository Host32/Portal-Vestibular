defmodule PortalVestibular.Inscricao do
  use PortalVestibular.Web, :model

  schema "inscricoes" do
    field :nome, :string
    field :endereco, :string
    field :telefone, :string
    field :celular, :string
    field :email, :string
    field :cpf, :string
    field :curso_1, :string
    field :curso_2, :string

    timestamps
  end

  @required_fields ~w(nome endereco telefone celular email cpf curso_1 curso_2)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
