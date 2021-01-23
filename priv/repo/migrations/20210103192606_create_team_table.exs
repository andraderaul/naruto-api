defmodule NarutoApi.Repo.Migrations.CreateTeamTable do
  use Ecto.Migration

  def change do
    create table(:teams, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :name, :string
      add :picture, :string

      timestamps()
    end
  end
end
