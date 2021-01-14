defmodule NarutoApi.Character.Update do
  alias NarutoApi.{Character, Repo}
  alias Ecto.UUID

  def call(%{"id" => uuid} = params) do
    case UUID.cast(uuid) do
      :error ->
        {:error, "Invalid id format!", :bad_request}

      {:ok, _uuuid} ->
        update(params)
    end
  end

  defp update(%{"id" => uuid} = params) do
    case fetch_character(uuid) do
      nil ->
        {:error, "Character not found!", :not_found}

      character ->
        update_character(character, params)
    end
  end

  def fetch_character(uuid), do: Repo.get(Character, uuid)

  defp update_character(character, params) do
    character
    |> Character.changeset(params)
    |> Repo.update()
  end
end
