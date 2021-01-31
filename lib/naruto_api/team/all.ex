defmodule NarutoApi.Team.All do
  import Ecto.Query
  alias NarutoApi.{Repo, Team}

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
    search(Team)
  end

  defp format_query_param(param), do: "%#{param}%"

  defp format_query_param(param, "end" = _position), do: "#{param}%"

  defp query(like), do: from(t in Team, where: ilike(t.name, ^like))

  defp search(query) do
    struct = Repo.all(query)
    {:ok, struct}
  end
end
