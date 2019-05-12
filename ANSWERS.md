# Exercise Solutions

A simple and readable solution to the beer song exercise.

```elixir
defmodule Beer do
  def verse(2) do
    """
    2 bottles of beer on the wall, 2 bottles of beer.
    Take one down and pass it around, 1 bottle of beer on the wall.
    """
  end

  def verse(1) do
    """
    1 bottle of beer on the wall, 1 bottle of beer.
    Take it down and pass it around, no more bottles of beer on the wall.
    """
  end

  def verse(0) do
    """
    No more bottles of beer on the wall, no more bottles of beer.
    Go to the store and buy some more, 99 bottles of beer on the wall.
    """
  end

  def verse(n) do
    """
    #{n} bottles of beer on the wall, #{n} bottles of beer.
    Take one down and pass it around, #{n - 1} bottles of beer on the wall.
    """
  end

  def sing(verse_start) do
    sing(verse_start, 0)
  end

  def sing(verse_start, verse_end) do
    Enum.map_join((verse_start..verse_end),"\n", verse(&1)) <> "\n"
  end
end
```
