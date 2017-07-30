defmodule Syts do
  @moduledoc """
  This is the Syts module.

  It provides functions for sending a YouTube search query (via youtube-dl), offering
  a selection of results to the user, and then playing a selected result in MPV.
  """

  @doc """
  Run the entire search - select - play operation.

  Returns `:ok`.

  ## Examples

      Syts.run "cat videos"
      :ok

  """
  @spec run(String.t()) :: :ok
  def run(query) do
    check_system_sanity!()
    search(query) |> offer_selection |> play_selection
    :ok
  end

  @doc """
  Perform system sanity checks.

  In particular, raise a `RuntimeError` if Syts's external dependencies are not
  installed.

  Returns `:ok`.
  """
  @spec check_system_sanity! :: :ok
  def check_system_sanity! do
    for cmd <- ["youtube-dl", "mpv"] do
      System.find_executable(cmd) || raise "Missing dependency: #{cmd}"
    end

    :ok
  end

  @doc """
  Run a YouTube search on a query string.

  This function uses `youtube-dl` internally.

  Returns a list of JSON-decoded maps.
  """
  @spec search(String.t) :: [map()]
  def search(query) do
    # 5 is hardcoded here, since it's a sweet spot between too few results
    # (not enough reasonable choices) and too many results (which take too long)
    query     = "ytsearch5:#{query}"
    {json, 0} = System.cmd("youtube-dl", ["--no-warnings", "-j", query])

    Enum.map(String.split(json, "\n", trim: true), &Poison.decode!/1)
  end

  @doc """
  Offer a list of playable options to the user, by title.

  This function lists the results of a query and accepts a number from the user indicating
  which video in the list to return.

  Returns a map of the selected video's information.
  """
  @spec offer_selection([map()]) :: map()
  def offer_selection(options) do
    options
      |> Enum.with_index
      |> Enum.each(fn {map, i} -> IO.puts "#{i}) #{map["fulltitle"]}" end)

    {choice, _} = Integer.parse IO.gets("? ")
    Enum.at(options, choice, 0)
  end

  @doc """
  Plays the given video in MPV.

  This function accepts a map describing a YouTube video, and plays that video in MPV.

  Returns `:ok`.
  """
  @spec play_selection(map()) :: :ok
  def play_selection(map) do
    {_, 0} = System.cmd("mpv", [map["url"]])
    :ok
  end
end
