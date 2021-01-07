defmodule NarutoApi.Team.All do
  alias NarutoApi.{Repo, Team}

  def call() do
    struct = Repo.all(Team)
    {:ok, struct}
  end
end
