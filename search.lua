--

local Search = {}

function Search.seqSearch(tbl, item)
  for i = 1, #tbl do
    if tbl[i] == item then
      return i
    end
  end
  return nil
end

function Search.binSearch(tbl, item)
  local mid = math.floor(#tbl / 2)
  local top, bottom = #tbl, 1
  
  while bottom <= top do
    if tbl[mid] < item then
      bottom = mid + 1
    elseif tbl[mid] > item then
      top = mid - 1
    elseif tbl[mid] == item then
      return mid
    end
    
    mid = math.floor((top + bottom) / 2)
  end
  
  return nil
end

return Search
