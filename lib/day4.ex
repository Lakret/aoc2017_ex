defmodule Day4 do
  
  @doc """
  Counts correct passphrases in passphrase list.

  ## Examples

    iex> Day4.count_valid("aa bb cc dd ee\\naa bb cc dd aa\\naa bb cc dd aaa")
    2

  """
  def count_valid(passphrases) do
    passphrases
    |> String.split("\n")
    |> Enum.filter(&is_valid_passphrase?/1)
    |> length()
  end

  def count_valid_in_file(filename) do
    File.read!(filename)
    |> count_valid()
  end

  defp is_valid_passphrase?(""), do: false
  defp is_valid_passphrase?(passphrase) do
    words = String.split(passphrase)
    length(words) == length(Enum.uniq(words))
  end
end
