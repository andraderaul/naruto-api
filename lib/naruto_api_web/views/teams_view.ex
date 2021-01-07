defmodule NarutoApiWeb.TeamsView do
  use NarutoApiWeb, :view

  alias NarutoApi.Team
  alias NarutoApiWeb.TeamsView

  def render("index.json", %{
        team: team
      }) do
    %{
      data: render_many(team, TeamsView, "team.json")
    }
  end

  def render("create.json", %{team: %Team{} = team}) do
    %{
      message: "Team created!",
      team: render("team.json", team: team)
    }
  end

  def render("show.json", %{team: %Team{} = team}) do
    render("team.json", team: team)
  end

  def render("update.json", %{team: %Team{} = team}) do
    render("team.json", team: team)
  end

  def render("team.json", %{
        team: %Team{
          id: id,
          name: name,
          inserted_at: inserted_at,
          updated_at: updated_at
        }
      }) do
    %{
      id: id,
      name: name,
      inserted_at: inserted_at,
      updated_at: updated_at
    }
  end
end
