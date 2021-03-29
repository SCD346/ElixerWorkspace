defmodule Identicon do
  def main(input) do
    input
    |> hash_input
  end

  # Returns a list of hexcodes
  def hash_input(input) do
    hex = :crypto.hash(:md5, input)
    |> :binary.bin_to_list

    %Identicon.Image{hex: hex}
  end
end
