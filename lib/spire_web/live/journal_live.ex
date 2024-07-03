defmodule SpireWeb.JournalLive do
  use SpireWeb, :live_view

  def mount(_params, _session, socket) do
    socket = socket |> assign(:entries, [])

    {:ok, socket}
  end

  def handle_event("save", %{"content" => content}, socket) do
    new_entry = %{time: DateTime.utc_now(), content: content}
    socket = socket |> update(:entries, &[new_entry | &1])

    {:noreply, socket}
  end
end
