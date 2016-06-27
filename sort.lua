-- names:       Adam Vandolder, Davanjit Sandhu, Israel Fowler
-- created:     June 21, 2016
-- file:        sort.lua
-- teacher:     Mr. Sarros
-- Contains implementations of the sorting algorithms.

local Sort = {}

function Sort.insertion(list)
  -- Sort list using the Insertion Sort algorithm.
  for top = 2, #list do
    -- Loop through every element in lst, except the first.
    local i, item = top, list[top]
    while i > 0 and item < list[i-1] do
      -- As long as item is less than the element below it,
      -- shift it down in the list.
      list[i] = list[i - 1]
      i = i - 1
    end
    -- Set the item in the new position.
    list[i] = item
  end
end

function Sort.bubble(list)
  -- Sort a list in place using the Bubble Sort algorithm.

  for top = #list, 1, -1 do
    -- If the list is already sorted, listSorted will stay true.
    local listSorted = true

    -- Loop through the list, with one less element every time.
    for i = 1, #top do
      -- Loop through the list up until top.
      if list[i + 1] < list[i] then
        -- If the next element is less than the current one,
        -- swap the elements.
        list[i], list[i + 1] = list[i + 1], list[i]
        -- If a swap occured, the list is not sorted.
        listSorted = false
      end
    end

    if listSorted then
      -- If the list is already sorted, stop looping.
      break
    end
  end
end

function Sort.quick(list, low, high)
  -- Perform an inplace sort using the Quick Sort algorithm.
  -- list is a list of comparable items.
  
  -- low and high are by default 0 and the length of the list.
  if low == nil then low = 0 end
  if high == nil then high = #list end

  if low < high then
    -- If low is > high, the sort on that part of the list is complete.
    local left, right = low, high
    local direction = 'left'
    local pivot = list[low]

    while left < right do
      -- While there is still elements to sort...
      if direction == 'left' then
        -- Loop through and shift lower items down in the list.
        while lst[right] >= pivot and left < right do
          right = right - 1
        end
        list[left] = list[right]
        direction = 'right'
      end

      if direction == 'right' then
        -- Loop through and shift higher items up in the list.
        while lst[left] <= pivot and left < right do
          left = left + 1
        end
        list[right] = list[left]
        direction = 'left'
      end
    end

    list[left] = pivot

    -- Recurse to continue the sort.
    Sort.quick(list, low, left - 1)
    Sort.quick(list, right + 1, high)
  end
end

return Sort
