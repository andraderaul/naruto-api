defmodule NarutoApi.Character.All do
  import Ecto.Query
  alias NarutoApi.{Repo, Character}

  def call(params) do
    cond do
      params["from"] != nil ->
        from = "#{params["from"]}%"
        query = from(c in Character, where: ilike(c.name, ^from))
        struct = Repo.all(query)
        {:ok, struct}

      params["name"] != nil ->
        from = "%#{params["name"]}%"
        query = from(c in Character, where: ilike(c.name, ^from))
        struct = Repo.all(query)
        {:ok, struct}

      true ->
        struct = Repo.all(Character)
        {:ok, struct}
    end
  end
end
