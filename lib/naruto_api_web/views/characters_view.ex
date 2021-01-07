defmodule NarutoApiWeb.CharactersView do
  use NarutoApiWeb, :view

  alias NarutoApi.Character

  def render("index.json", %{
        character: character
      }) do
    %{
      data: render_many(character, __MODULE__, "character.json", as: :character)
    }
  end

  def render("create.json", %{
        character: %Character{} = character
      }) do
    %{
      message: "Character created!",
      character: render("character.json", character: character)
    }
  end

  def render("show.json", %{character: %Character{} = character}) do
    render("character.json", character: character)
  end

  def render("update.json", %{character: %Character{} = character}) do
    render("character.json", character: character)
  end

  def render(
        "character.json",
        %{
          character: %Character{
            id: id,
            name: name,
            kanji_name: kanji_name,
            birthday: birthday,
            age: age,
            gender: gender,
            height: height,
            weight: weight,
            inserted_at: inserted_at,
            updated_at: updated_at
          }
        }
      ) do
    %{
      id: id,
      name: name,
      kanji_name: kanji_name,
      birthday: birthday,
      age: age,
      gender: gender,
      height: height,
      weight: weight,
      inserted_at: inserted_at,
      updated_at: updated_at
    }
  end
end
