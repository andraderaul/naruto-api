defmodule NarutoApi.Jutsu do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, Ecto.UUID, autogenerate: true}

  schema "jutsus" do
    field :name, :string

    timestamps()
  end

  @required [:name]

  def build(params) do
    params
    |> changeset()
    |> apply_action(:insert)
  end

  def changeset(params), do: create_changeset(%__MODULE__{}, params)
  def changeset(jutsu, params), do: create_changeset(jutsu, params)

  def create_changeset(module_or_jutsu, params) do
    module_or_jutsu
    |> cast(params, @required)
    |> validate_required(@required)
  end
end
