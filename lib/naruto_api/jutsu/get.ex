defmodule NarutoApi.Jutsu.Get do
  alias NarutoApi.{Repo, Jutsu}
  alias Ecto.UUID

  def call(id) do
    case UUID.cast(id) do
      :error ->
        {:error, "Invalid id format!", :bad_request}

      {:ok, uuid} ->
        get(uuid)
    end
  end

  defp get(uuid) do
    case Repo.get(Jutsu, uuid) do
      nil ->
        {:error, "Jutsu not found!", :not_found}

      jutsu ->
        {:ok, jutsu}
    end
  end
end
