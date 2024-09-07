defmodule SpireWeb.JournalLive do
  alias Spire.Notes
  use SpireWeb, :live_view

  def mount(_params, _session, socket) do
    notes = Notes.list_notes()
    tags = Notes.list_tags()

    socket =
      socket
      |> assign(:tags, tags)
      |> stream(:notes, notes)

    {:ok, socket}
  end

  def handle_event("save", %{"content" => content}, socket) do
    {:ok, new_note} = Notes.create_note(%{content: content})

    tags = Notes.list_tags()

    socket =
      socket
      |> assign(:tags, tags)

    socket =
      socket
      |> stream_insert(:notes, new_note, at: 0)

    {:noreply, socket}
  end
end
