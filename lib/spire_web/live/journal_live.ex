defmodule SpireWeb.JournalLive do
  alias Spire.Notes
  use SpireWeb, :live_view

  def mount(_params, _session, socket) do
    notes = Notes.list_notes()
    IO.inspect(notes)

    socket = socket |> assign(:notes, notes)
    {:ok, socket}
  end

  def handle_event("save", %{"content" => content}, socket) do
    {:ok, new_note} = Notes.create_note(%{content: content})

    socket = socket |> update(:notes, &[new_note | &1])
    {:noreply, socket}
  end
end
