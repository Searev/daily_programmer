# DailyProgrammer

This project, written in [Elixir](http://elixir-lang.org/), aims at solving the problems submitted on the
[Daily Programmer Reddit Page](https://www.reddit.com/r/dailyprogrammer).

## Requirements

* [Elixir](http://elixir-lang.org/)

## Installation

Once the project is cloned, install the dependencies using Mix:

```bash
mix deps.get
```

## Usage

All challenges are located in the `lib` folder. To test one, start by compiling the project using Mix:

```bash
mix compile
```

Then, launch the Elixir CLI using

```bash
iex -S mix
```

You can now start experimenting with the various modules and problems. All challenges are grouped into specific modules, so you can simply
import the one you are interested in.

```elixir
iex(1)> import DailyProgrammer.WordFunnel
DailyProgrammer.WordFunnel
iex(2)> funnel("leave", "eave")
true
```

## Documentation

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc).

```bash
mix docs
```