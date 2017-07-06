defmodule DrabPoc.LiveCommander do
  require IEx
  require Logger

  use Drab.Commander, modules: [Drab.Live]

  def uppercase(socket, _sender) do
    text = peek(socket, :text)
    poke socket, text: String.upcase(text)
  end

  def replace_list(socket, _sender) do
    Drab.Live.poke socket, users: ["Mścisław", "Bożydar", "Mściwój", "Bogumił", "Mirmił"]
  end

  def replace_title(socket, _sender) do
    Drab.Live.poke socket, title: "New, better Title"
  end

  def add_to_list(socket, _sender) do
    users = Drab.Live.peek(socket, :users)
    Drab.Live.poke socket, users: users ++ ["Hegemon"]
  end

  def changed_label(socket, sender) do
    poke socket, label: sender["value"]
  end

  def enlage_your_button_now(socket, _sender) do
    poke socket, button_height: peek(socket, :button_height) + 2
  end
end
