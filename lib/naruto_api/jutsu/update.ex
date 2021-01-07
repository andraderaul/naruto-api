defmodule NarutoApi.Jutsu.Update do
  alias NarutoApi.{Jutsu, Repo}
  alias Ecto.UUID

  def call(%{"id" => uuid} = params) do
    case UUID.cast(uuid) do
      :error ->
        {:error, "Invalid id format!"}

      {:ok, _uuid} ->
        update(params)
    end
  end

  defp update(%{"id" => uuid} = params) do
    case fetch_jutsu(uuid) do
      nil ->
        {:error, "Jutsu not found!"}

      jutsu ->
        update_jutsu(jutsu, params)
    end
  end

  def fetch_jutsu(uuid), do: Repo.get(Jutsu, uuid)

  defp update_jutsu(team, params) do
    team
    |> Jutsu.changeset(params)
    |> Repo.update()
  end
end
