defmodule Spire.NotesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Spire.Notes` context.
  """

  @doc """
  Generate a note.
  """
  def note_fixture(attrs \\ %{}) do
    {:ok, note} =
      attrs
      |> Enum.into(%{
        content: "some content"
      })
      |> Spire.Notes.create_note()

    note
  end

  @doc """
  Generate a tag.
  """
  def tag_fixture(attrs \\ %{}) do
    {:ok, tag} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> Spire.Notes.create_tag()

    tag
  end
end
