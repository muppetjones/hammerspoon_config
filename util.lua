partial = hs.fnutils.partial

-- gets propery or method value
-- on a table
function result(obj, property)
  if not obj then return nil end

  if isFunction(property) then
    return property(obj)
  elseif isFunction(obj[property]) then -- string
    return obj[property](obj) -- <- this will be the source of bugs
  else
    return obj[property]
  end
end

-- Chain multiple functions
function compose(...)
  local functions = {...}
  return function (...)
    local retval

    for i, func in ipairs(functions) do
      if i == 1 then
        retval = func(...)
      else
        retval = func(retval)
      end
    end

    return retval
  end
end

-- Flips the order of parameters passed to a function
function flip(func)
  return function(...)
    return func(table.unpack(reverse({...})))
  end
end

-- join two itables
function join(t1, t2)
    for k, v in pairs(t2) do
        table.insert(t1, v)
    end
end

-- split a string into tables
function split(str, pat)
   local t = {}  -- NOTE: use {n = 0} in Lua-5.0
   local fpat = "(.-)" .. pat
   local last_end = 1
   local s, e, cap = str:find(fpat, 1)
   while s do
      if s ~= 1 or cap ~= "" then
	 table.insert(t,cap)
      end
      last_end = e+1
      s, e, cap = str:find(fpat, last_end)
   end
   if last_end <= #str then
      cap = str:sub(last_end)
      table.insert(t, cap)
   end
   return t
end


-- property, object
function getProperty(property)
    return hs.fnutils.partial(flip(result), property)
end
