defmodule NarutoApi do
  alias NarutoApi.{Character, Team, Jutsu}

  defdelegate create_character(params), to: Character.Create, as: :call
  defdelegate fetch_character(params), to: Character.Get, as: :call
  defdelegate update_character(params), to: Character.Update, as: :call
  defdelegate delete_character(params), to: Character.Delete, as: :call
  defdelegate all_character(), to: Character.All, as: :call

  defdelegate create_team(params), to: Team.Create, as: :call
  defdelegate fetch_team(params), to: Team.Get, as: :call
  defdelegate update_team(params), to: Team.Update, as: :call
  defdelegate delete_team(params), to: Team.Delete, as: :call

  defdelegate create_jutsu(params), to: Jutsu.Create, as: :call
  defdelegate fetch_jutsu(params), to: Jutsu.Get, as: :call
  defdelegate update_jutsu(params), to: Jutsu.Update, as: :call
  defdelegate delete_jutsu(params), to: Jutsu.Delete, as: :call
end
