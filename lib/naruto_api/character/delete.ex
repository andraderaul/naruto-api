defmodule NarutoApi.Character.Delete do
  alias NarutoApi.{Repo, Character}
  alias Ecto.UUID

  def call(id) do
    case UUID.cast(id) do
      :error ->
        {:error, "Invalid id format!", :bad_request}

      {:ok, uuid} ->
        delete(uuid)
    end
  end

  defp delete(uuid) do
    case fetch_character(uuid) do
      nil -> {:error, "Character not found!", :not_found}
      character -> Repo.delete(character)
    end
  end

  defp fetch_character(uuid), do: Repo.get(Character, uuid)
end
