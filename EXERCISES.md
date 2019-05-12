# Pattern Matching Exercises

Use `mix new beer_song` to create a new Elixir project.

Reference the tests below to guide your implementation.

## The Beer Song

Recite the lyrics to that beloved classic, that field-trip favorite: 99 Bottles of Beer on the Wall.

#### Note that not all verses are identical.

```
99 bottles of beer on the wall, 99 bottles of beer.
Take one down and pass it around, 98 bottles of beer on the wall.

...

3 bottles of beer on the wall, 3 bottles of beer.
Take one down and pass it around, 2 bottles of beer on the wall.

2 bottles of beer on the wall, 2 bottles of beer.
Take one down and pass it around, 1 bottle of beer on the wall.

1 bottle of beer on the wall, 1 bottle of beer.
Take it down and pass it around, no more bottles of beer on the wall.

No more bottles of beer on the wall, no more bottles of beer.
Go to the store and buy some more, 99 bottles of beer on the wall.
```

### Tests

To exclude pending tests from running add this line to `test/test_helper.exs`:

    ExUnit.configure(exclude: :pending, trace: true)

Put these tests into your `test/beer_test.exs` and run with `mix test`.

```elixir
  test "getting the first verse (99 bottles)" do
    assert BeerSong.verse(99) == """
           99 bottles of beer on the wall, 99 bottles of beer.
           Take one down and pass it around, 98 bottles of beer on the wall.
           """
  end

  @tag :pending
  test "getting the second verse (98 bottles)" do
    assert BeerSong.verse(98) == """
           98 bottles of beer on the wall, 98 bottles of beer.
           Take one down and pass it around, 97 bottles of beer on the wall.
           """
  end

  @tag :pending
  test "getting just the penultimate verse" do
    assert BeerSong.verse(1) == """
           1 bottle of beer on the wall, 1 bottle of beer.
           Take it down and pass it around, no more bottles of beer on the wall.
           """
  end

  @tag :pending
  test "getting just the last verse" do
    assert BeerSong.verse(0) == """
           No more bottles of beer on the wall, no more bottles of beer.
           Go to the store and buy some more, 99 bottles of beer on the wall.
           """
  end

  @tag :pending
  test "getting the last 4 verses" do
    assert BeerSong.lyrics(3..0) == """
           3 bottles of beer on the wall, 3 bottles of beer.
           Take one down and pass it around, 2 bottles of beer on the wall.

           2 bottles of beer on the wall, 2 bottles of beer.
           Take one down and pass it around, 1 bottle of beer on the wall.

           1 bottle of beer on the wall, 1 bottle of beer.
           Take it down and pass it around, no more bottles of beer on the wall.

           No more bottles of beer on the wall, no more bottles of beer.
           Go to the store and buy some more, 99 bottles of beer on the wall.
           """
  end

  @tag :pending
  test "getting the whole song" do
    assert BeerSong.lyrics() == """
           99 bottles of beer on the wall, 99 bottles of beer.
           Take one down and pass it around, 98 bottles of beer on the wall.

           98 bottles of beer on the wall, 98 bottles of beer.
           Take one down and pass it around, 97 bottles of beer on the wall.

           97 bottles of beer on the wall, 97 bottles of beer.
           Take one down and pass it around, 96 bottles of beer on the wall.

           96 bottles of beer on the wall, 96 bottles of beer.
           Take one down and pass it around, 95 bottles of beer on the wall.

           95 bottles of beer on the wall, 95 bottles of beer.
           Take one down and pass it around, 94 bottles of beer on the wall.

           94 bottles of beer on the wall, 94 bottles of beer.
           Take one down and pass it around, 93 bottles of beer on the wall.

           93 bottles of beer on the wall, 93 bottles of beer.
           Take one down and pass it around, 92 bottles of beer on the wall.

           92 bottles of beer on the wall, 92 bottles of beer.
           Take one down and pass it around, 91 bottles of beer on the wall.

           91 bottles of beer on the wall, 91 bottles of beer.
           Take one down and pass it around, 90 bottles of beer on the wall.

           90 bottles of beer on the wall, 90 bottles of beer.
           Take one down and pass it around, 89 bottles of beer on the wall.

           89 bottles of beer on the wall, 89 bottles of beer.
           Take one down and pass it around, 88 bottles of beer on the wall.

           88 bottles of beer on the wall, 88 bottles of beer.
           Take one down and pass it around, 87 bottles of beer on the wall.

           87 bottles of beer on the wall, 87 bottles of beer.
           Take one down and pass it around, 86 bottles of beer on the wall.

           86 bottles of beer on the wall, 86 bottles of beer.
           Take one down and pass it around, 85 bottles of beer on the wall.

           85 bottles of beer on the wall, 85 bottles of beer.
           Take one down and pass it around, 84 bottles of beer on the wall.

           84 bottles of beer on the wall, 84 bottles of beer.
           Take one down and pass it around, 83 bottles of beer on the wall.

           83 bottles of beer on the wall, 83 bottles of beer.
           Take one down and pass it around, 82 bottles of beer on the wall.

           82 bottles of beer on the wall, 82 bottles of beer.
           Take one down and pass it around, 81 bottles of beer on the wall.

           81 bottles of beer on the wall, 81 bottles of beer.
           Take one down and pass it around, 80 bottles of beer on the wall.

           80 bottles of beer on the wall, 80 bottles of beer.
           Take one down and pass it around, 79 bottles of beer on the wall.

           79 bottles of beer on the wall, 79 bottles of beer.
           Take one down and pass it around, 78 bottles of beer on the wall.

           78 bottles of beer on the wall, 78 bottles of beer.
           Take one down and pass it around, 77 bottles of beer on the wall.

           77 bottles of beer on the wall, 77 bottles of beer.
           Take one down and pass it around, 76 bottles of beer on the wall.

           76 bottles of beer on the wall, 76 bottles of beer.
           Take one down and pass it around, 75 bottles of beer on the wall.

           75 bottles of beer on the wall, 75 bottles of beer.
           Take one down and pass it around, 74 bottles of beer on the wall.

           74 bottles of beer on the wall, 74 bottles of beer.
           Take one down and pass it around, 73 bottles of beer on the wall.

           73 bottles of beer on the wall, 73 bottles of beer.
           Take one down and pass it around, 72 bottles of beer on the wall.

           72 bottles of beer on the wall, 72 bottles of beer.
           Take one down and pass it around, 71 bottles of beer on the wall.

           71 bottles of beer on the wall, 71 bottles of beer.
           Take one down and pass it around, 70 bottles of beer on the wall.

           70 bottles of beer on the wall, 70 bottles of beer.
           Take one down and pass it around, 69 bottles of beer on the wall.

           69 bottles of beer on the wall, 69 bottles of beer.
           Take one down and pass it around, 68 bottles of beer on the wall.

           68 bottles of beer on the wall, 68 bottles of beer.
           Take one down and pass it around, 67 bottles of beer on the wall.

           67 bottles of beer on the wall, 67 bottles of beer.
           Take one down and pass it around, 66 bottles of beer on the wall.

           66 bottles of beer on the wall, 66 bottles of beer.
           Take one down and pass it around, 65 bottles of beer on the wall.

           65 bottles of beer on the wall, 65 bottles of beer.
           Take one down and pass it around, 64 bottles of beer on the wall.

           64 bottles of beer on the wall, 64 bottles of beer.
           Take one down and pass it around, 63 bottles of beer on the wall.

           63 bottles of beer on the wall, 63 bottles of beer.
           Take one down and pass it around, 62 bottles of beer on the wall.

           62 bottles of beer on the wall, 62 bottles of beer.
           Take one down and pass it around, 61 bottles of beer on the wall.

           61 bottles of beer on the wall, 61 bottles of beer.
           Take one down and pass it around, 60 bottles of beer on the wall.

           60 bottles of beer on the wall, 60 bottles of beer.
           Take one down and pass it around, 59 bottles of beer on the wall.

           59 bottles of beer on the wall, 59 bottles of beer.
           Take one down and pass it around, 58 bottles of beer on the wall.

           58 bottles of beer on the wall, 58 bottles of beer.
           Take one down and pass it around, 57 bottles of beer on the wall.

           57 bottles of beer on the wall, 57 bottles of beer.
           Take one down and pass it around, 56 bottles of beer on the wall.

           56 bottles of beer on the wall, 56 bottles of beer.
           Take one down and pass it around, 55 bottles of beer on the wall.

           55 bottles of beer on the wall, 55 bottles of beer.
           Take one down and pass it around, 54 bottles of beer on the wall.

           54 bottles of beer on the wall, 54 bottles of beer.
           Take one down and pass it around, 53 bottles of beer on the wall.

           53 bottles of beer on the wall, 53 bottles of beer.
           Take one down and pass it around, 52 bottles of beer on the wall.

           52 bottles of beer on the wall, 52 bottles of beer.
           Take one down and pass it around, 51 bottles of beer on the wall.

           51 bottles of beer on the wall, 51 bottles of beer.
           Take one down and pass it around, 50 bottles of beer on the wall.

           50 bottles of beer on the wall, 50 bottles of beer.
           Take one down and pass it around, 49 bottles of beer on the wall.

           49 bottles of beer on the wall, 49 bottles of beer.
           Take one down and pass it around, 48 bottles of beer on the wall.

           48 bottles of beer on the wall, 48 bottles of beer.
           Take one down and pass it around, 47 bottles of beer on the wall.

           47 bottles of beer on the wall, 47 bottles of beer.
           Take one down and pass it around, 46 bottles of beer on the wall.

           46 bottles of beer on the wall, 46 bottles of beer.
           Take one down and pass it around, 45 bottles of beer on the wall.

           45 bottles of beer on the wall, 45 bottles of beer.
           Take one down and pass it around, 44 bottles of beer on the wall.

           44 bottles of beer on the wall, 44 bottles of beer.
           Take one down and pass it around, 43 bottles of beer on the wall.

           43 bottles of beer on the wall, 43 bottles of beer.
           Take one down and pass it around, 42 bottles of beer on the wall.

           42 bottles of beer on the wall, 42 bottles of beer.
           Take one down and pass it around, 41 bottles of beer on the wall.

           41 bottles of beer on the wall, 41 bottles of beer.
           Take one down and pass it around, 40 bottles of beer on the wall.

           40 bottles of beer on the wall, 40 bottles of beer.
           Take one down and pass it around, 39 bottles of beer on the wall.

           39 bottles of beer on the wall, 39 bottles of beer.
           Take one down and pass it around, 38 bottles of beer on the wall.

           38 bottles of beer on the wall, 38 bottles of beer.
           Take one down and pass it around, 37 bottles of beer on the wall.

           37 bottles of beer on the wall, 37 bottles of beer.
           Take one down and pass it around, 36 bottles of beer on the wall.

           36 bottles of beer on the wall, 36 bottles of beer.
           Take one down and pass it around, 35 bottles of beer on the wall.

           35 bottles of beer on the wall, 35 bottles of beer.
           Take one down and pass it around, 34 bottles of beer on the wall.

           34 bottles of beer on the wall, 34 bottles of beer.
           Take one down and pass it around, 33 bottles of beer on the wall.

           33 bottles of beer on the wall, 33 bottles of beer.
           Take one down and pass it around, 32 bottles of beer on the wall.

           32 bottles of beer on the wall, 32 bottles of beer.
           Take one down and pass it around, 31 bottles of beer on the wall.

           31 bottles of beer on the wall, 31 bottles of beer.
           Take one down and pass it around, 30 bottles of beer on the wall.

           30 bottles of beer on the wall, 30 bottles of beer.
           Take one down and pass it around, 29 bottles of beer on the wall.

           29 bottles of beer on the wall, 29 bottles of beer.
           Take one down and pass it around, 28 bottles of beer on the wall.

           28 bottles of beer on the wall, 28 bottles of beer.
           Take one down and pass it around, 27 bottles of beer on the wall.

           27 bottles of beer on the wall, 27 bottles of beer.
           Take one down and pass it around, 26 bottles of beer on the wall.

           26 bottles of beer on the wall, 26 bottles of beer.
           Take one down and pass it around, 25 bottles of beer on the wall.

           25 bottles of beer on the wall, 25 bottles of beer.
           Take one down and pass it around, 24 bottles of beer on the wall.

           24 bottles of beer on the wall, 24 bottles of beer.
           Take one down and pass it around, 23 bottles of beer on the wall.

           23 bottles of beer on the wall, 23 bottles of beer.
           Take one down and pass it around, 22 bottles of beer on the wall.

           22 bottles of beer on the wall, 22 bottles of beer.
           Take one down and pass it around, 21 bottles of beer on the wall.

           21 bottles of beer on the wall, 21 bottles of beer.
           Take one down and pass it around, 20 bottles of beer on the wall.

           20 bottles of beer on the wall, 20 bottles of beer.
           Take one down and pass it around, 19 bottles of beer on the wall.

           19 bottles of beer on the wall, 19 bottles of beer.
           Take one down and pass it around, 18 bottles of beer on the wall.

           18 bottles of beer on the wall, 18 bottles of beer.
           Take one down and pass it around, 17 bottles of beer on the wall.

           17 bottles of beer on the wall, 17 bottles of beer.
           Take one down and pass it around, 16 bottles of beer on the wall.

           16 bottles of beer on the wall, 16 bottles of beer.
           Take one down and pass it around, 15 bottles of beer on the wall.

           15 bottles of beer on the wall, 15 bottles of beer.
           Take one down and pass it around, 14 bottles of beer on the wall.

           14 bottles of beer on the wall, 14 bottles of beer.
           Take one down and pass it around, 13 bottles of beer on the wall.

           13 bottles of beer on the wall, 13 bottles of beer.
           Take one down and pass it around, 12 bottles of beer on the wall.

           12 bottles of beer on the wall, 12 bottles of beer.
           Take one down and pass it around, 11 bottles of beer on the wall.

           11 bottles of beer on the wall, 11 bottles of beer.
           Take one down and pass it around, 10 bottles of beer on the wall.

           10 bottles of beer on the wall, 10 bottles of beer.
           Take one down and pass it around, 9 bottles of beer on the wall.

           9 bottles of beer on the wall, 9 bottles of beer.
           Take one down and pass it around, 8 bottles of beer on the wall.

           8 bottles of beer on the wall, 8 bottles of beer.
           Take one down and pass it around, 7 bottles of beer on the wall.

           7 bottles of beer on the wall, 7 bottles of beer.
           Take one down and pass it around, 6 bottles of beer on the wall.

           6 bottles of beer on the wall, 6 bottles of beer.
           Take one down and pass it around, 5 bottles of beer on the wall.

           5 bottles of beer on the wall, 5 bottles of beer.
           Take one down and pass it around, 4 bottles of beer on the wall.

           4 bottles of beer on the wall, 4 bottles of beer.
           Take one down and pass it around, 3 bottles of beer on the wall.

           3 bottles of beer on the wall, 3 bottles of beer.
           Take one down and pass it around, 2 bottles of beer on the wall.

           2 bottles of beer on the wall, 2 bottles of beer.
           Take one down and pass it around, 1 bottle of beer on the wall.

           1 bottle of beer on the wall, 1 bottle of beer.
           Take it down and pass it around, no more bottles of beer on the wall.

           No more bottles of beer on the wall, no more bottles of beer.
           Go to the store and buy some more, 99 bottles of beer on the wall.
           """
  end
```

## Advanced: List functions

Implement List functions from scratch without using the `Enum` module (only recursion and pattern matching).
Please do not use Kernel functions for Lists like `++`, `--`, `hd`, `tl`, `in`, and `length`.

These tests can guide you.

```elixir
  test "count of empty list" do
    assert L.count([]) == 0
  end

  @tag :pending
  test "count of normal list" do
    assert L.count([1, 3, 5, 7]) == 4
  end

  @tag :pending
  test "count of huge list" do
    assert L.count(Enum.to_list(1..1_000_000)) == 1_000_000
  end

  @tag :pending
  test "reverse of empty list" do
    assert L.reverse([]) == []
  end

  @tag :pending
  test "reverse of normal list" do
    assert L.reverse([1, 3, 5, 7]) == [7, 5, 3, 1]
  end

  @tag :pending
  test "reverse of huge list" do
    assert L.reverse(Enum.to_list(1..1_000_000)) == Enum.to_list(1_000_000..1)
  end

  @tag :pending
  test "map of empty list" do
    assert L.map([], &(&1 + 1)) == []
  end

  @tag :pending
  test "map of normal list" do
    assert L.map([1, 3, 5, 7], &(&1 + 1)) == [2, 4, 6, 8]
  end

  @tag :pending
  test "map of huge list" do
    assert L.map(Enum.to_list(1..1_000_000), &(&1 + 1)) == Enum.to_list(2..1_000_001)
  end

  @tag :pending
  test "filter of empty list" do
    assert L.filter([], &odd?/1) == []
  end

  @tag :pending
  test "filter of normal list" do
    assert L.filter([1, 2, 3, 4], &odd?/1) == [1, 3]
  end

  @tag :pending
  test "filter of huge list" do
    assert L.filter(Enum.to_list(1..1_000_000), &odd?/1) == Enum.map(1..500_000, &(&1 * 2 - 1))
  end

  @tag :pending
  test "reduce of empty list" do
    assert L.reduce([], 0, &(&1 + &2)) == 0
  end

  @tag :pending
  test "reduce of normal list" do
    assert L.reduce([1, 2, 3, 4], -3, &(&1 + &2)) == 7
  end

  @tag :pending
  test "reduce of huge list" do
    assert L.reduce(Enum.to_list(1..1_000_000), 0, &(&1 + &2)) ==
             Enum.reduce(1..1_000_000, 0, &(&1 + &2))
  end

  @tag :pending
  test "reduce with non-commutative function" do
    assert L.reduce([1, 2, 3, 4], 10, fn x, acc -> acc - x end) == 0
  end

  @tag :pending
  test "append of empty lists" do
    assert L.append([], []) == []
  end

  @tag :pending
  test "append of empty and non-empty list" do
    assert L.append([], [1, 2, 3, 4]) == [1, 2, 3, 4]
  end

  @tag :pending
  test "append of non-empty and empty list" do
    assert L.append([1, 2, 3, 4], []) == [1, 2, 3, 4]
  end

  @tag :pending
  test "append of non-empty lists" do
    assert L.append([1, 2, 3], [4, 5]) == [1, 2, 3, 4, 5]
  end

  @tag :pending
  test "append of huge lists" do
    assert L.append(Enum.to_list(1..1_000_000), Enum.to_list(1_000_001..2_000_000)) ==
             Enum.to_list(1..2_000_000)
  end

  @tag :pending
  test "concat of empty list of lists" do
    assert L.concat([]) == []
  end

  @tag :pending
  test "concat of normal list of lists" do
    assert L.concat([[1, 2], [3], [], [4, 5, 6]]) == [1, 2, 3, 4, 5, 6]
  end

  @tag :pending
  test "concat of huge list of small lists" do
    assert L.concat(Enum.map(1..1_000_000, &[&1])) == Enum.to_list(1..1_000_000)
  end

  @tag :pending
  test "concat of small list of huge lists" do
    assert L.concat(Enum.map(0..9, &Enum.to_list((&1 * 100_000 + 1)..((&1 + 1) * 100_000)))) ==
             Enum.to_list(1..1_000_000)
  end
```
