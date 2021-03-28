defmodule Cards do

# Define a method: 1
  def create_deck do
    values = ["Ace", "Two", "Three", "Four", "Five"]
    suits = ["Spades", "Clubs", "Hearts", "Diamonds"]

# SOLUTION 1: WEAK SOLUTION
  #   cards = for value <- values do
  #     for suit <- suits do
  #       "#{value} of #{suit}"
  #     end
  #   end

  #   List.flatten(cards)
  # end

# SOLUTION 2: BETTER SOLUTION
    # 2 computations running at same time, less code, no additional computations
    for suit <- suits, value <- values do
        "#{value} of #{suit}"
    end
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

# Define a method: 4
  # using split method: takes in a list (deck) and an integer (represents the lenght of the list you want returned)
  # then 'splits' it into two enumerables (lists), 1: a list the length if the integer provided, 2: a list with the leftovers
  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  # FUNCTION: Save a deck
  def save(deck, filename) do
              # Erlang.term_to_binary: takes the deck argument, turns it into an object so it can be saved
    binary = :erlang.term_to_binary(deck)
              # object saved from above, passed to file.write to be saved
    File.write(filename, binary)
  end

  # FUNCTION: Loads in a file, handles errors
  def load(filename) do
    case File.read(filename) do
      {:ok, binary} -> :erlang.binary_to_term binary
      {:error, _reason} -> "That file does NOT exist."
    end
  end

    # FUNCTION: combines create, shuffle, deal into on function
  def create_hand(hand_size) do
    # # version without pipe operator
    # deck = Cards.create_deck
    # deck = Cards.shuffle(deck)
    # hand = Cards.deal(deck, hand_size)
    # # Refactored version, with pipe operator
    Cards.create_deck
    |> Cards.shuffle
    |> Cards.deal(hand_size)
  end
end






