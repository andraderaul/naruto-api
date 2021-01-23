defmodule NarutoApiWeb.JutsusView do
  use NarutoApiWeb, :view

  alias NarutoApi.Jutsu

  def render("index.json", %{
        jutsu: jutsu
      }) do
    %{
      data: render_many(jutsu, __MODULE__, "jutsu.json", as: :jutsu)
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
          picture: picture,
          inserted_at: inserted_at,
          updated_at: updated_at
        }
      }) do
    %{
      id: id,
      name: name,
      picture: picture,
      inserted_at: inserted_at,
      updated_at: updated_at
    }
  end
end
