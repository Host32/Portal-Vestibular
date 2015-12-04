defmodule PortalVestibular.Repo.Migrations.CreateInscricao do
  use Ecto.Migration

  def change do
    create table(:inscricoes) do
      add :nome, :string
      add :endereco, :string
      add :telefone, :string
      add :celular, :string
      add :email, :string
      add :cpf, :string
      add :curso_1, :string
      add :curso_2, :string

      timestamps
    end

  end
end
