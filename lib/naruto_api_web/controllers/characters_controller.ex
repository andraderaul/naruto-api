defmodule NarutoApiWeb.CharactersController do
  use NarutoApiWeb, :controller

  action_fallback NarutoApiWeb.FallbackController

  def index(conn, _params) do
    characters = NarutoApi.index_character()
    handle_response(characters, conn, "index.json", :ok)
  end

  def create(conn, params) do
    params
    |> NarutoApi.create_character()
    |> handle_response(conn, "create.json", :created)
  end

  def show(conn, %{"id" => id}) do
    id
    |> NarutoApi.fetch_character()
    |> handle_response(conn, "show.json", :ok)
  end

  def delete(conn, %{"id" => id}) do
    id
    |> NarutoApi.delete_character()
    |> handle_delete(conn)
  end

  def update(conn, params) do
    params
    |> NarutoApi.update_character()
    |> handle_response(conn, "update.json", :ok)
  end

  defp handle_delete({:ok, _character}, conn) do
    conn
    |> put_status(:no_content)
    |> text("")
  end

  defp handle_delete({:error, _reason} = error, _conn), do: error

  defp handle_response({:ok, character}, conn, view, status) do
    conn
    |> put_status(status)
    |> render(view, character: character)
  end

  defp handle_response({:error, _changeset} = error, _conn, _view, _status), do: error
end
