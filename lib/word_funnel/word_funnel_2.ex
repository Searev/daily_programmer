defmodule DailyProgrammer.WordFunnel2 do
    import DailyProgrammer.WordFunnel
    alias String, as: S

    @moduledoc """
    ## Description
    This modules aims at solving the 
    [Daily Programmer Challenge #366 [Intermediate] on Reddit](https://www.reddit.com/r/dailyprogrammer/comments/99d24u/20180822_challenge_366_intermediate_word_funnel_2)
    """

    @doc """
    Given a word, determine the length of the longest word funnel that it starts. You may optionally also return the funnel itself (or any
    funnel tied for the longest, in the case of a tie).

    ## Examples

        iex > funnel2("gnash")
        4
        iex > funnel2("princesses")
        9
        iex > funnel2("turntables")
        5
        iex > funnel2("implosive")
        1
        iex > funnel2("programmer")
        2
    """
    def funnel2(a) do
        words = load_word_list()
        get_depth(create_word_funnel_tree([a], words))
    end

    @doc """
    Generates a tree of all possible funnels. The root of the tree is the word
    from which the funnel should be made; and every node represent a word that
    is a funnel of its parent. The leafs are the words that cannot be used to
    create a funnel.
    
    The longuest funnel is the path that leads to the leaf of maximum depth.

    This algorithm can certainly be optimized, as it passes over the entire set
    of words fo
    """
    def create_word_funnel_tree([a], dict) do
         funnels = for word <- dict, S.length(a) == S.length(word) + 1 and is_funnel(S.codepoints(a), S.codepoints(word)) do
            create_word_funnel_tree([word], dict)
        end
        [a | funnels]
    end

    @doc """
    Get the depth of a tree.

    ## Examples
        iex > get_depth(["a"])
        1
        iex > get_depth(["gash", ["ash", ["ah"], ["as"], ["sh"]], ["gas", ["as"]]])
        3
    """
    def get_depth([_]) do 1 end
    def get_depth([_ | branches]) do 
        lengths = for branch <- branches do
            get_depth(branch) + 1
        end
        get_max_list(lengths)
    end

    @doc """
    Returns the maximum number contained in a list

    ## Example

        iex > get_max_list([1, 3, 7, 2, 5])
        7
    """
    def get_max_list([a]) do a end
    def get_max_list([h | t]) do max(h, get_max_list(t)) end

end