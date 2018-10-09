function Class(base,o)
    local instance = o or {}
	setmetatable(instance, base)
	instance.base = base
	base.__index = base
	instance.New = function()
		return instance
	end
    return instance
end