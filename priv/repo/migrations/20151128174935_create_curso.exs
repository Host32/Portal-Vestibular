defmodule PortalVestibular.Repo.Migrations.CreateCurso do
  use Ecto.Migration

  def change do
    create table(:cursos) do
      add :nome, :string
      add :duracao, :integer
      add :periodo, :string
      add :valor, :float
      add :descricao_curta, :text
      add :descricao_longa, :text
      add :banner_pequeno, :string
      add :banner_grande, :string
      add :foto_1, :string
      add :foto_2, :string
      add :foto_3, :string
      add :foto_4, :string

      timestamps
    end

  end
end
