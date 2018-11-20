defmodule DailyProgrammer.WordFunnel do
    @moduledoc """
    
    ## Description
    This modules aims at solving the
    [Daily Programmer Challenge #366 [Easy] on Reddit](https://www.reddit.com/r/dailyprogrammer/comments/98ufvz/20180820_challenge_366_easy_word_funnel_1)
    """

    @doc """
    Given two strings of letters, determine whether the second can be made from the first by removing one letter. The remaining letters must stay in the same order.

    ## Examples

        iex > funnel("leave", "eave")
        true
        iex > funnel("reset", "rest")
        true
        iex > funnel("dragoon", "dragon")
        true
        iex > funnel("eave", "leave")
        false
        iex > funnel("sleet", "lets")
        false
        iex > funnel("skiff", "ski")
        false
    """
    def funnel(a, b) do
        words = load_word_list()
        letters_a = String.codepoints(a)
        letters_b = String.codepoints(b)
        a in words and b in words and is_funnel(letters_a, letters_b)
    end

    def is_funnel([_ | t], []) do length(t) == 0 end
    def is_funnel([h1 | t1], [h2 | t2]) when h1 == h2 do is_funnel(t1, t2) end
    def is_funnel([_ | t1], b) do t1 == b end

    def load_word_list() do
        case File.read "lib/word_funnel/words.txt" do
            {:ok, file} -> String.split(file, "\n")
            {:error, _} -> IO.puts("The file could not be read")
        end
    end
end