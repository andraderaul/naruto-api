defmodule NarutoApi.Team do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, Ecto.UUID, autogenerate: true}

  schema "teams" do
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
  def changeset(team, params), do: create_changeset(team, params)

  def create_changeset(module_or_team, params) do
    module_or_team
    |> cast(params, @required)
    |> validate_required(@required)
  end
end
