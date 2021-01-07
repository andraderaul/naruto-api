defmodule NarutoApiWeb.JutsusView do
  use NarutoApiWeb, :view

  alias NarutoApi.Jutsu
  alias NarutoApiWeb.JutsusView

  def render("index.json", %{
        jutsu: jutsu
      }) do
    %{
      data: render_many(jutsu, JutsusView, "jutsu.json")
    }
  end

  def render("create.json", %{jutsu: %Jutsu{} = jutsu}) do
    %{
      message: "Jutsu created!",
      jutsu: render("jutsu.json", jutsu: jutsu)
    }
  end

  def render("show.json", %{jutsu: %Jutsu{} = jutsu}) do
    render("jutsu.json", jutsu: jutsu)
  end

  def render("update.json", %{jutsu: %Jutsu{} = jutsu}) do
    render("jutsu.json", jutsu: jutsu)
  end

  def render("jutsu.json", %{
        jutsu: %Jutsu{
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
