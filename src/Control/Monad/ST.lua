-- module Control.Monad.ST
local ST = {}

ST.newSTRef = function (val)
  return function ()
    return { value = val }
  end
end

ST.readSTRef = function (ref)
  return function ()
    return ref.value
  end
end

ST.modifySTRef = function (ref)
  return function (f)
    return function ()
      ref.value = f(ref.value)
	  return ref.value
    end
  end
end

ST.writeSTRef = function (ref)
  return function (a)
    return function ()
      ref.value = a
	  return ref.value
    end
  end
end

ST.runST = function (f)
  return f
end

return ST
