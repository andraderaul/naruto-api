defmodule NarutoApi.Repo.Migrations.CreateJutsuTable do
  use Ecto.Migration

  def change do
    create table(:jutsus, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :name, :string
      add :picture, :string

      timestamps()
    end
  end
end
