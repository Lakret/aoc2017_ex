defmodule Day2 do
  
  @doc """
  Finds the checksum of the spreadsheet.

  ## Examples

    iex> Day2.checksum("5 1 9 5\\n7 5 3\\n2 4 6 8")
    18

  """
  def checksum(spreadsheet) do
    lines = String.split(spreadsheet, "\n")
    line_differeneces = 
      for line <- lines, line != "" do
        {min, max} = 
          String.split(line)
          |> Enum.map(&String.to_integer/1)
          |> Enum.min_max()
        max - min
      end
    Enum.sum(line_differeneces)
  end

  def checksum_file(filename) do
    File.read!(filename)
    |> checksum()
  end
end
