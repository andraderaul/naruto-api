defmodule NarutoApi.Character.Get do
  alias NarutoApi.{Repo, Character}
  alias Ecto.UUID

  def call(id) do
    case UUID.cast(id) do
      :error ->
        {:error, "Invalid id format!"}

      {:ok, uuid} ->
        get(uuid)
    end
  end

  defp get(uuid) do
    case Repo.get(Character, uuid) do
      nil ->
        {:error, "Character not found!"}

      character ->
        {:ok, character}
    end
  end
end
