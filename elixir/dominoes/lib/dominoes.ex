defmodule Dominoes do
  @type domino :: {1..6, 1..6}

  @doc """
  chain?/1 takes a list of domino stones and returns boolean indicating if it's
  possible to make a full chain
  """
  @spec chain?(dominoes :: [domino] | []) :: boolean
  def chain?([]), do: true


  # This might be inefficient
  # Unsure if we have to traverse the entire list to count the elements
  def chain?(dominoes) when length(dominoes) == 1 do
    domino = List.last(dominoes)

    elem(domino, 0) == elem(domino, 1)
  end

  def chain?(dominoes) do
    # {1, 2}, {3, 1}, {2, 3}
    # Take the first element
    # Take the second element check if any numbers match.
    # If so, create a new pair with the leftover numbers
    # Take the next pair - repeat

    # {1,2}, {4,5}, {2,3}
    # Take the first element
    # Take the second element check if any numbers match.
    # If not, push that value into a new list of unmatched numbers (it could be the last domino)
    # Take the next element check if any numbers match.

    # {1,2}, {4,3}, {2,3}
    # [h|t] = dominoes

    # chain?(t, [h])
  end

  # Keep track of the start and ends.
  # Is this a doubly linked list?
  # This breaks the above algo
  # {1,2}, {2,3}, {2,2}
  # {1,2}, {2,3}, {2,2}, {1, 3}, {3, 1}, {3, 1} --> {1, 3}, {3, 1}, {1, 2}, {2, 2}, {2, 3}, {3, 1}

# {1,2}, {2,3}, {2,2}

  # head/tail nil -> unvisited [{1,2}, {2,3}, {2,2}]
    # head/tail {1,2} -> unvisited [{2,3}, {2,2}]
      # head/tail {1,3} -> unvisited [{2, 2}]

  # {1, 2} -> {2, 3}
    # {1, 3} -> x
  # {1, 2} -> {2, 2}
    # {1, 2} -> {2, 3}
      # {1, 3} -> o

  # def do_something(nil, dominoes)
  #  [head|tail] = dominoes
  #  elem = head if elem.nil?
  #  elem.first == head.last
  #    new_elem = {head.first, elem.last}
  #  elem.last == head.first
  #    new_elem = {elem.first, head.last}
  #
  #  do_something(new_elem, tail)



  @doc """
  chain?/2 takes a list of domino stones and returns boolean indicating if it's
  possible to make a full chain.
  """
  def chain?(dominoes, unmatched) do
    # {4,3}, {2,3}
    # {1,2}
    # [domino|t] = dominoes


    # if elem(domino, 0) == elem(unmatched_domino, 0)
    #   new_domino
    # else if elem(domino, 0) == elem(unmatched_domino, 1)
    # else if elem(domino, 1) == elem(unmatched_domino, 0)
    # else if elem(domino, 1) == elem(unmatched_domino, 1)
    # end

  end
end
