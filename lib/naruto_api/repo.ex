defmodule NarutoApi.Repo do
  use Ecto.Repo,
    otp_app: :naruto_api,
    adapter: Ecto.Adapters.Postgres
end
