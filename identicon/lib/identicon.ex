defmodule Identicon do
  def main(input) do
    input
    |> hash_input
    |> pick_color
    |> build_grid
    |> filter_odd_squares
    |> build_pixel_map
  end

  def build_pixel_map(%Identicon.Image{grid: grid} = image) do
  # iterate over each tuple, assign XY coords for placement on grid
    pixel_map = Enum.map grid, fn({_code, index}) ->
      horizontal = rem(index, 5) * 50
      vertical = div(index, 5) * 50

      top_left = {horizontal, vertical}
      bottom_right = {horizontal + 50, vertical + 50}

      {top_left, bottom_right}
    end
    %Identicon.Image{image | pixel_map: pixel_map}
  end

  def filter_odd_squares(%Identicon.Image{grid: grid} = image) do
    grid = Enum.filter grid, fn({code, _index}) ->
    # if the code is divisible by 0, return true (color the square)
      rem(code, 2) == 0
    end

    %Identicon.Image{image | grid: grid}
  end

  # Create grid that determines which squares are colored or white
    # each inner list represents a row in grid
  def build_grid(%Identicon.Image{hex: hex} = image) do
    grid = hex
    # send hex list to chunck - get back a list of lists
    |> Enum.chunk(3)
    # send list of lists to map
    |> Enum.map(&mirror_row/1)
    # List module- takes a nested list, makes one single list, retains
    # original order of all values
    |> List.flatten
    # Using index we need to track where we are within the list
    |> Enum.with_index

    %Identicon.Image{image | grid: grid}
  end


  # Mirror the elements in list, append to end, dont repeat middle
  def mirror_row(row) do
    # take in: [145, 46, 200]
    [first, second | _tail] = row
    # output: [145, 46, 200, 46, 200]
    row ++ [second, first]
  end


  # Using pattern matching, get first 3 vals from hex vals,
  # _tail takes the rest of the hex values away - we dont need them
  def pick_color(%Identicon.Image{hex: [r, g, b | _tail]} = image) do
    %Identicon.Image{image | color: {r, g, b}}
  end


  # Returns a list of hexcodes
  def hash_input(input) do
    hex = :crypto.hash(:md5, input)
    |> :binary.bin_to_list

    %Identicon.Image{hex: hex}
  end
end
