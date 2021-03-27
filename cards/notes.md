Elixir Documentation: https://elixir-lang.org/docs.html

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
