defmodule NarutoApi.Character.Create do
  alias NarutoApi.{Repo, Character}

  def call(params) do
    params
    |> Character.build()
    |> create_character()
  end

  defp create_character({:ok, struct}), do: Repo.insert(struct)
  defp create_character({:error, _changeset} = error), do: error
end
