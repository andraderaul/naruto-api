defmodule NarutoApi.Character.All do
  alias NarutoApi.{Repo, Character}

  def call() do
    struct = Repo.all(Character)
    {:ok, struct}
  end
end
