defmodule Spire.Repo.Migrations.AddNotesTagsJoinTable do
  use Ecto.Migration

  def change do
    create table(:notes_tags, primary_key: false) do
      add :note_id, references(:notes, on_delete: :delete_all), primary_key: true, null: false
      add :tag_id, references(:tags, on_delete: :delete_all), primary_key: true, null: false
    end

    create unique_index(:notes_tags, [:note_id, :tag_id])
  end
end
