defmodule NarutoApi.Team.Update do
  alias NarutoApi.{Team, Repo}
  alias Ecto.UUID

  def call(%{"id" => uuid} = params) do
    case UUID.cast(uuid) do
      :error ->
        {:error, "Invalid id format!", :bad_request}

      {:ok, _uuid} ->
        update(params)
    end
  end

  defp update(%{"id" => uuid} = params) do
    case fetch_team(uuid) do
      nil ->
        {:error, "Team not found!", :not_found}

      team ->
        update_team(team, params)
    end
  end

  defp fetch_team(uuid), do: Repo.get(Team, uuid)

  defp update_team(team, params) do
    team
    |> Team.changeset(params)
    |> Repo.update()
  end
end
