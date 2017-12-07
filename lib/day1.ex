defmodule Day1 do

  @doc """
  Solves captcha by calculating the sum of all digits that match the next digit in the list.

  ## Examples

    iex> Day1.solve_captcha("1122")
    3

    iex> Day1.solve_captcha("1111")
    4

    iex> Day1.solve_captcha("1234")
    0

    iex> Day1.solve_captcha("91212129")
    9

  """
  def solve_captcha(""), do: 0
  def solve_captcha(captcha) when is_binary(captcha) do
    last_elem = String.last(captcha)
    {res, _} = Enum.reduce(String.graphemes(captcha), {0, last_elem}, fn(elem, {acc, prev_elem}) ->
      new_acc =
        if elem == prev_elem do
          acc + String.to_integer(prev_elem)
        else
          acc
        end
      {new_acc, elem}
    end)
    res
  end
end
