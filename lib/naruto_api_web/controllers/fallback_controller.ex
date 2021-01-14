defmodule NarutoApiWeb.FallbackController do
  use NarutoApiWeb, :controller

  def call(conn, {:error, :unauthorized}) do
    conn
    |> put_status(:unauthorized)
    |> put_view(NarutoApiWeb.ErrorView)
    |> render("401.json", message: "User unauthorized")
  end

  def call(conn, {:error, result, status}) do
    conn
    |> put_status(status)
    |> put_view(NarutoApiWeb.ErrorView)
    |> render("400.json", result: result)
  end

  def call(conn, {:error, result}) do
    conn
    |> put_status(:bad_request)
    |> put_view(NarutoApiWeb.ErrorView)
    |> render("400.json", result: result)
  end
end
