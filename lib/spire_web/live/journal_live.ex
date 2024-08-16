defmodule SpireWeb.JournalLive do
  alias Spire.Notes
  use SpireWeb, :live_view

  @tag_regex ~r/#(\w*[0-9a-zA-Z]+\w*[0-9a-zA-Z])/

  def mount(_params, _session, socket) do
    notes = Notes.list_notes()

    # TODO: stream results
    socket = socket |> assign(:notes, notes)
    {:ok, socket}
  end

  def handle_event("save", %{"content" => content}, socket) do
    tags =
      content
      |> parse_tags_from_message()
      |> Enum.map(&%{name: &1})

    # TODO: tags should re-use the same tag when they have the same name
    {:ok, new_note} =
      Notes.create_note(%{
        content: content,
        tags: tags
      })

    socket = socket |> update(:notes, &[new_note | &1])

    {:noreply, socket}
  end

  defp parse_tags_from_message(content) do
    Regex.scan(@tag_regex, content, capture: :all_but_first)
    |> List.flatten()
  end
end
