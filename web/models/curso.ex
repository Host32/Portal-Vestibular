defmodule PortalVestibular.Curso do
  use PortalVestibular.Web, :model

  schema "cursos" do
    field :nome, :string
    field :duracao, :integer
    field :periodo, :string
    field :valor, :float
    field :descricao_curta, :string
    field :descricao_longa, :string
    field :banner_pequeno, :string
    field :banner_grande, :string
    field :foto_1, :string
    field :foto_2, :string
    field :foto_3, :string
    field :foto_4, :string

    timestamps
  end

  @required_fields ~w(nome duracao periodo valor descricao_curta descricao_longa banner_pequeno banner_grande)
  @optional_fields ~w(foto_1 foto_2 foto_3 foto_4)

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
