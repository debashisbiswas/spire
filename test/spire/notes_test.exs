defmodule Spire.NotesTest do
  use Spire.DataCase

  alias Spire.Notes

  describe "notes" do
    alias Spire.Notes.Note

    import Spire.NotesFixtures

    @invalid_attrs %{content: nil}

    test "list_notes/0 returns all notes" do
      note = note_fixture()
      assert Notes.list_notes() == [note]
    end

    test "get_note!/1 returns the note with given id" do
      note = note_fixture()
      assert Notes.get_note!(note.id) == note
    end

    test "create_note/1 with valid data creates a note" do
      valid_attrs = %{content: "some content"}

      assert {:ok, %Note{} = note} = Notes.create_note(valid_attrs)
      assert note.content == "some content"
    end

    test "create_note/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Notes.create_note(@invalid_attrs)
    end

    test "update_note/2 with valid data updates the note" do
      note = note_fixture()
      update_attrs = %{content: "some updated content"}

      assert {:ok, %Note{} = note} = Notes.update_note(note, update_attrs)
      assert note.content == "some updated content"
    end

    test "update_note/2 with invalid data returns error changeset" do
      note = note_fixture()
      assert {:error, %Ecto.Changeset{}} = Notes.update_note(note, @invalid_attrs)
      assert note == Notes.get_note!(note.id)
    end

    test "delete_note/1 deletes the note" do
      note = note_fixture()
      assert {:ok, %Note{}} = Notes.delete_note(note)
      assert_raise Ecto.NoResultsError, fn -> Notes.get_note!(note.id) end
    end

    test "change_note/1 returns a note changeset" do
      note = note_fixture()
      assert %Ecto.Changeset{} = Notes.change_note(note)
    end
  end

  describe "tags" do
    alias Spire.Notes.Tag

    import Spire.NotesFixtures

    @invalid_attrs %{name: nil}

    test "list_tags/0 returns all tags" do
      tag = tag_fixture()
      assert Notes.list_tags() == [tag]
    end

    test "get_tag!/1 returns the tag with given id" do
      tag = tag_fixture()
      assert Notes.get_tag!(tag.id) == tag
    end

    test "create_tag/1 with valid data creates a tag" do
      valid_attrs = %{name: "some name"}

      assert {:ok, %Tag{} = tag} = Notes.create_tag(valid_attrs)
      assert tag.name == "some name"
    end

    test "create_tag/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Notes.create_tag(@invalid_attrs)
    end

    test "update_tag/2 with valid data updates the tag" do
      tag = tag_fixture()
      update_attrs = %{name: "some updated name"}

      assert {:ok, %Tag{} = tag} = Notes.update_tag(tag, update_attrs)
      assert tag.name == "some updated name"
    end

    test "update_tag/2 with invalid data returns error changeset" do
      tag = tag_fixture()
      assert {:error, %Ecto.Changeset{}} = Notes.update_tag(tag, @invalid_attrs)
      assert tag == Notes.get_tag!(tag.id)
    end

    test "delete_tag/1 deletes the tag" do
      tag = tag_fixture()
      assert {:ok, %Tag{}} = Notes.delete_tag(tag)
      assert_raise Ecto.NoResultsError, fn -> Notes.get_tag!(tag.id) end
    end

    test "change_tag/1 returns a tag changeset" do
      tag = tag_fixture()
      assert %Ecto.Changeset{} = Notes.change_tag(tag)
    end
  end
end
