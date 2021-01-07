defmodule NarutoApiWeb.TeamsController do
  use NarutoApiWeb, :controller

  action_fallback NarutoApiWeb.FallbackController

  def create(conn, params) do
    params
    |> NarutoApi.create_team()
    |> handle_response(conn, "create.json", :created)
  end

  def show(conn, %{"id" => id}) do
    id
    |> NarutoApi.fetch_team()
    |> handle_response(conn, "show.json", :ok)
  end

  def update(conn, params) do
    params
    |> NarutoApi.update_team()
    |> handle_response(conn, "update.json", :ok)
  end

  def delete(conn, %{"id" => id}) do
    id
    |> NarutoApi.delete_team()
    |> handle_delete(conn)
  end

  defp handle_delete({:ok, _character}, conn) do
    conn
    |> put_status(:no_content)
    |> text("")
  end

  defp handle_delete({:error, _reason} = error, _conn), do: error

  defp handle_response({:ok, team}, conn, view, status) do
    conn
    |> put_status(status)
    |> render(view, team: team)
  end

  defp handle_response({:error, _changeset} = error, _conn, _view, _status), do: error
end
