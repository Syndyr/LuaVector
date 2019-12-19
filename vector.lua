--[[

    This is the vector metatype library.
    Its purpose is to add a simple vector implimentation to
    Lua, specifically for use within graphics and/or game engines.
    This is a purely Lua implimentation.

]]--
local vecDef = {}
				--I've had to break it up like this since some Lua versions 
				--throw a hissy-fit if the method table and function table
				--are the same table. Go figure.
local vec = { --Method metatable for metamethods.
    __index = vecDef,
    __unm = function(a)
		local solved = Vector(0,0,0)
        solved.x = -a.x
        solved.y = -a.y
        solved.z = -a.z
        return solved
    end,
    __add = function(a,b) 
        local solved = Vector(0,0,0)
        if type(b) == "number" then b = Vector(b,b,b) end
        solved.x = a.x + b.x
        solved.y = a.y + b.y
        solved.z = a.z + b.z
        return solved
    end,
    __sub = function(a,b) 
        local solved = Vector(0,0,0)
        if type(b) == "number" then b = Vector(b,b,b) end
        solved.x = a.x - b.x
        solved.y = a.y - b.y
        solved.z = a.z - b.z
        return solved
    end,
    __mul = function(a,b) 
        local solved = Vector(0,0,0)
        if type(b) == "number" then b = Vector(b,b,b) end
        solved.x = a.x * b.x
        solved.y = a.y * b.y
        solved.z = a.z * b.z
        return solved
    end,
    __div = function(a,b) 
        local solved = Vector(0,0,0)
        if type(b) == "number" then b = Vector(b,b,b) end
        solved.x = a.x / b.x
        solved.y = a.y / b.y
        solved.z = a.z / b.z
        return solved
    end,
    __mod = function(a,b) 
        local solved = Vector(0,0,0)
        if type(b) == "number" then b = Vector(b,b,b) end
        solved.x = a.x % b.x
        solved.y = a.y % b.y
        solved.z = a.z % b.z
        return solved
    end,
    __pow = function(a,b) 
        local solved = Vector(0,0,0)
        if type(b) == "number" then b = Vector(b,b,b) end
        solved.x = a.x ^ b.x
        solved.y = a.y ^ b.y
        solved.z = a.z ^ b.z
        return solved
    end,
    __eq = function(a,b)
        if a.x ~= b.x then return false end
        if a.y ~= b.y then return false end
        if a.z ~= b.z then return false end
        return true
    end,
    __lt = function(a,b)
        if a.x < b.x then return true end
        if a.y < b.y then return true end
        if a.z < b.z then return true end
        return false
    end,
    __le = function(a,b)
        if a.x <= b.x then return true end
        if a.y <= b.y then return true end
        if a.z <= b.z then return true end
        return false
    end
}

--[[

    A distance function, works in 3 diamentions,
    x, y and z.
    b is the target.

]]--
function vecDef:dist(b) 
    if type(self) ~= "table" or type(self) ~= "table" or getmetatable(self) ~= vec then 
        return 0, v()
    else 
        if self.x == nil then 
            return 0, v()
        end
    end
    return math.sqrt((b.x-self.x)^2+(b.y-self.y)^2+(b.z-self.z)^2), v(b.x-self.x, b.y-self.y, b.z-self.z)
end

--[[

    Simple bounds checking function.
    Checks if p[oint] is within a and b.

]]--
function vecDef:inBounds2D(b, p)
    return  p.x >= self.x and
            p.y >= self.y and
            p.x <= b.x and
            p.y <= b.y
end

--[[

    A simple 2D bearing function, takes a and b,
    returning the bearing to point b from point a.

]]--
function vecDef:bearing2D(b)
    local dist, delta = self:dist(b)
    return math.atan2(delta.x, delta.y), dist, delta
end

--[[
    A tangent function that returns magic
]]--
function vecDef:tangent2D(b, dist)
    
    local bearing = self:bearing2D(b)-(math.pi*0.5)
    local bearing2 = bearing + math.pi
    return v(math.sin( bearing )*dist, math.cos( bearing )*dist )+self, v(math.sin( bearing2 )*dist, math.cos( bearing2 )*dist)+self
    
end

--[[

    A human readability function.
    round will state if the x/y/z axis should be rounded

]]
function vecDef:toString(round)
    if round == nil then round = false end
    local x,y,z = self:splitxyz(round)
    str = "[x="..x..", y="..y..", z="..x.."]"
    return str
end

--[[

    A quick way to get seperate x/y/z values.

]]--
function vecDef:splitxyz(round)
    if round then
        return math.floor(self.x+0.5), math.floor(self.y+0.5), math.floor(self.z+0.5)
    else
        return self.x, self.y, self.z
    end
end

--[[

	Individual set/get functions for all three axis.

]]--
function vecDef:x(a) 
    if a ~= nil then self.x = a end
    return self.x 
end

function vecDef:y(a) 
    if a ~= nil then self.y = a end
    return self.y 
end

function vecDef:z(a) 
    if a ~= nil then self.z = a end
    return self.z 
end

--[[

    A creation function

]]--
function Vector(x,y,z)
    if z == nil then z = 0 end
    if y == nil then y = 0 end
    if x == nil then x = 0 end
    local t = {}
    if type(x) == "table" then 
        setmetatable(t, vec)
        t.x = x[1]
        t.y = x[2]
        t.z = x[3]
        
    else
        setmetatable(t, vec)
        t.x = x
        t.y = y
        t.z = z
    end
    return t
end

--[[

    The creation function, but shorter. 

]]--
function v(x,y,z)
    return Vector(x,y,z)
end