defmodule NarutoApi.Character.Index do
  alias NarutoApi.{Repo, Character}

  def call() do
    struct = Repo.all(Character)
    {:ok, struct}
  end
end
