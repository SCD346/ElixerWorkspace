defmodule Cards do

# Define a method: 1
  def create_deck do
    ["Ace", "Two", "Three"]
  end

# Define a method: 2
  # shuffle method found in Enum module of Elixir documentation: https://hexdocs.pm/elixir/Enum.html#member?/2
    # returns a 'copy', does not edit or impact the original
  def shuffle(deck) do
    Enum.shuffle(deck)
  end

# Define a method: 3
  # contains method, also found in Enum module
  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

end