defmodule Identicon do
  def main(input) do
    input
    |> hash_input
    |> pick_color
  end

  def pick_color(image) do
  # Using pattern matching, get first 3 vals from hex vals,
  # _tail takes the rest of the hex values away - we dont need them
    %Identicon.Image{hex: [r, g, b | _tail]} = image
    [r, g, b]
  end

  # Returns a list of hexcodes
  def hash_input(input) do
    hex = :crypto.hash(:md5, input)
    |> :binary.bin_to_list

    %Identicon.Image{hex: hex}
  end
end
