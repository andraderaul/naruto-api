defmodule NarutoApi.Jutsu.All do
  alias NarutoApi.{Repo, Jutsu}

  def call() do
    struct = Repo.all(Jutsu)
    {:ok, struct}
  end
end
