defmodule NarutoApi.Jutsu.All do
  import Ecto.Query
  alias NarutoApi.{Repo, Jutsu}

  def call(%{"from" => from} = _params) do
    from
    |> format_query_param("end")
    |> query()
    |> search()
  end

  def call(%{"name" => name} = _params) do
    name
    |> format_query_param()
    |> query()
    |> search()
  end

  def call(_params) do
    search(Jutsu)
  end

  defp format_query_param(param), do: "%#{param}%"

  defp format_query_param(param, "end" = _position), do: "#{param}%"

  defp query(like), do: from(j in Jutsu, where: ilike(j.name, ^like))

  defp search(query) do
    struct = Repo.all(query)
    {:ok, struct}
  end
end
