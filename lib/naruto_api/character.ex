defmodule NarutoApi.Character do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, Ecto.UUID, autogenerate: true}

  schema "characters" do
    field :name, :string
    field :kanji_name, :string
    field :birthday, :string
    field :age, {:array, :integer}
    field :gender, :string
    field :height, {:array, :float}
    field :weight, {:array, :float}
    field :picture, :string

    timestamps()
  end

  @field [:name, :kanji_name, :birthday, :age, :gender, :height, :weight, :picture]
  @required [:name]

  def build(params) do
    params
    |> changeset()
    |> apply_action(:insert)
  end

  def changeset(params), do: create_changeset(%__MODULE__{}, params)
  def changeset(character, params), do: create_changeset(character, params)

  def create_changeset(module_or_character, params) do
    module_or_character
    |> cast(params, @field)
    |> validate_required(@required)
  end
end
