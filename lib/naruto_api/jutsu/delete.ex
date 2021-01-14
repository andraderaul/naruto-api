defmodule NarutoApi.Jutsu.Delete do
  alias NarutoApi.{Repo, Jutsu}
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
    case fetch_jutsu(uuid) do
      nil -> {:error, "Jutsu not found!", :not_found}
      jutsu -> Repo.delete(jutsu)
    end
  end

  defp fetch_jutsu(uuid), do: Repo.get(Jutsu, uuid)
end
