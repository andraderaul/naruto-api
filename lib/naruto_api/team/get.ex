defmodule NarutoApi.Team.Get do
  alias NarutoApi.{Repo, Team}
  alias Ecto.UUID

  def call(id) do
    case UUID.cast(id) do
      :error ->
        {:error, "Invalid id format!"}

      {:ok, uuid} ->
        get(uuid)
    end
  end

  defp get(uuid) do
    case Repo.get(Team, uuid) do
      nil ->
        {:error, "Team not found!"}

      team ->
        {:ok, team}
    end
  end
end
