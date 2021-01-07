defmodule NarutoApiWeb.JutsusController do
  use NarutoApiWeb, :controller

  action_fallback NarutoApiWeb.FallbackController

  def index(conn, _params) do
    jutsus = NarutoApi.all_jutsu()
    handle_response(jutsus, conn, "index.json", :ok)
  end

  def create(conn, params) do
    params
    |> NarutoApi.create_jutsu()
    |> handle_response(conn, "create.json", :created)
  end

  def show(conn, %{"id" => id}) do
    id
    |> NarutoApi.fetch_jutsu()
    |> handle_response(conn, "show.json", :ok)
  end

  def update(conn, params) do
    params
    |> NarutoApi.update_jutsu()
    |> handle_response(conn, "update.json", :ok)
  end

  def delete(conn, %{"id" => id}) do
    id
    |> NarutoApi.delete_jutsu()
    |> handle_delete(conn)
  end

  defp handle_delete({:ok, _character}, conn) do
    conn
    |> put_status(:no_content)
    |> text("")
  end

  defp handle_delete({:error, _reason} = error, _conn), do: error

  defp handle_response({:ok, jutsu}, conn, view, status) do
    conn
    |> put_status(status)
    |> render(view, jutsu: jutsu)
  end

  defp handle_response({:error, _changeset} = error, _conn, _view, _status), do: error
end
