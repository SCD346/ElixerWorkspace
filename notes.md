Elixir Documentation: https://elixir-lang.org/docs.html - Elixir sits on top of Erlang
Image documentation: Erlang EGD - http://erlang.org/documentation/doc-6.1/lib/percept-0.8.9/doc/html/egd.html

#Section 1: An Elixir Warmup

- Get INTO Elixir Shell: iex -S mix
- Get OUT of shell: Ctrl + C (twice)
- After code edits run 'recompile' command in Elixir Shell

Mix is a command line tool, piece of Elixir ecosystem.
Mix used for: generating projects, compiling projects, run tasks (run tests, manage dependencies)

Generate a Project
run command: mix new projectname

Arity: Refers to number of arguments a function accepts.

- Example: Cards.shuffle/1
  - This function has an arity of 1, meaning it accepts 1 argument.

#Section 2: Elixir's Amazing Pattern Matching

- This is a replacement for variable assignement (JS)

CODE WE WRITE
gets fed into
ELIXIR
transpiled into
ERLANG
compiled and executed
BEAM

BEAM stands for "Bodgan/Bjon's Earland Abstract Machine"

2 Primitive Data Types, also known as an Atom
:ok
:error

- Atoms with Strings are used to put together something for the user - Like an error message
- Use an underscore infront of an Atom name to avoid the unused variable error message , needed for pattern matching

Combine functions with pipe operator |
-MUST HAVE CONSISTENT FIRST ARGUMENTS in order for this to work

#Documentation
XDOC - generate a standalone documentation

#Section 3: Testing and Documentation

- Xdoc: used to wrote two types of documentation
  1.  Mudule Documentation: summarized module, here is what this module does
  2.  Function Documentation: documents the purpose of individual functions
- write comments for xdoc as follows:
  1. MODULES
     @muduledoc """
     Write what the MODULE does here
     """
  2. FUNCTIONS
     @doc """
     Write what the FUNCTION does here
     """
- COMMAND: mix docs

DOC TESTS

- Example code can be used for test.

  - Doctests are written as follows:

  ## Examples

  iex> deck = Cards.create_deck
  iex> Cards.contains?(deck, "Ace of Spades")
  true

"""

- File: cards_test.exs must contain line: doctest Cards

CASE TESTS

Section 4: A Few Side Topics

- MAPS
- collections of key value pairs
- Example of a map
  colors = %{primary: "red", secondary: "blue"}
- Use dot.notation to access
  - colors.secondary will return "blue"
- Use pattern matching to access
  - %{secondary: secondary_color} = colors
- Update a map
  - Map.put(colors, :primary, "yellow")
- Create a new map

  - %{ colors | primary: "blue" }

- KEYWORD LISTS
  - Lists are like arrays
  - Tuples, each index has special meaning
- Create a Keyword list - its a list that contains tuples
  - colors = [{:primary, "red"}, {:secondary, "green"}] - access with colors[:primary]
    ECTO LIBRARY - example use case of a keyword list in ecto
    query = Users.find_where([where: user.age > 10, where: user.subscribed == true]}

#Section 6: Structs - Elixir's Data Modeling Tool

- STRUCT: is a map that is used to store data in an Elixir application - just like maps - Two advantages over maps: 1) Can be assigned default values 2) Some additional compile time checking of properties

- Elixir supports the ability to pattern match values directly out of the argument list.

- Enum.chunk(3) - takes a longer list and makes 3 shorter, even sized lists, drops remainder

- To join lists together: ++

- Enum.map() - sends every element of list, runs some function on each, gets a return value on that function, then puts these elements in a new list

- To pass a reference to a function: &function_name/1 (1 means: use the function_name that uses 1 argument)

  - Example: |> Enum.map(&mirror_row/1)

- rem(coce, 2) #calculated the remainder

- Create a Phoenix project: mix phoenix.new projectname

#Section 7: On to Phoenix

- Turn on Phoenix: mix.phoenix.server
- Must turn on Postgres manually
- Restart Postgres Sever: brew services restart postgres
- Start up server inside of Elixir shell: iex -S phoenix.server
  - (helps w/ debugging)

#Section 8: MVC in Phoenix

- MVC

  - MODEL: the raw data of the topic
  - VIEW: a template that takes the model and makes it look nice
  - CONTROLLER: figures out what user is looking for, gets model
    puts it in a view, returns results

    get "/topics/new", TopicController, :new

    - Get request
    - at domain/topics/new
    - request is sent to the TopicController
    - specifically, the new function
