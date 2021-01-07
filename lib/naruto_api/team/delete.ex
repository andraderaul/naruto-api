defmodule NarutoApi.Team.Delete do
  alias NarutoApi.{Repo, Team}
  alias Ecto.UUID

  def call(id) do
    case UUID.cast(id) do
      :error ->
        {:error, "Invalid id format!"}

      {:ok, uuid} ->
        delete(uuid)
    end
  end

  defp delete(uuid) do
    case fetch_team(uuid) do
      nil -> {:error, "Team not found!"}
      team -> Repo.delete(team)
    end
  end

  defp fetch_team(uuid), do: Repo.get(Team, uuid)
end
