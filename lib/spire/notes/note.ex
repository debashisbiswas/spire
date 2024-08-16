defmodule Spire.Notes.Note do
  use Ecto.Schema
  import Ecto.Changeset

  schema "notes" do
    field :content, :string
    many_to_many :tags, Spire.Notes.Tag, join_through: "notes_tags"

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(note, attrs) do
    note
    |> cast(attrs, [:content])
    |> cast_assoc(:tags)
    |> validate_required([:content])
  end
end
