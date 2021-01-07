defmodule NarutoApi.Team.Create do
  alias NarutoApi.{Repo, Team}

  def call(params) do
    params
    |> Team.build()
    |> create_team()
  end

  defp create_team({:ok, struct}), do: Repo.insert(struct)
  defp create_team({:error, _changeset} = error), do: error
end
