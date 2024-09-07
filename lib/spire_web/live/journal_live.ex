defmodule SpireWeb.JournalLive do
  alias Spire.Notes
  use SpireWeb, :live_view

  def mount(_params, _session, socket) do
    notes = Notes.list_notes()

    socket = socket |> stream(:notes, notes)
    {:ok, socket}
  end

  def handle_event("save", %{"content" => content}, socket) do
    {:ok, new_note} = Notes.create_note(content)

    socket = socket |> stream_insert(:notes, new_note, at: 0)

    {:noreply, socket}
  end
end
