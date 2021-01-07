defmodule NarutoApi.Repo.Migrations.CreateCharacterTable do
  use Ecto.Migration

  def change do
    create table(:characters, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :name, :string
      add :kanji_name, :string
      add :birthday, :string
      add :age, {:array, :integer}
      add :gender, :string
      add :height, {:array, :float}
      add :weight, {:array, :float}

      timestamps()
    end
  end
end
