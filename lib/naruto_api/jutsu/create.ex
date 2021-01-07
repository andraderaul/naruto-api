defmodule NarutoApi.Jutsu.Create do
  alias NarutoApi.{Repo, Jutsu}

  def call(params) do
    params
    |> Jutsu.build()
    |> create_jutsu()
  end

  defp create_jutsu({:ok, struct}), do: Repo.insert(struct)
  defp create_jutsu({:error, _changeset} = error), do: error
end
