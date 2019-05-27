local function int_to_bytes(i)
	local x=i+32768--clip to positive integers
	local cH = math.floor(x /           256) % 256;
	local cL = math.floor(x                ) % 256;
	return(string.char(cH, cL));
end
local function bytes_to_int(bytes)
	local t={string.byte(bytes,1,-1)}
	local n = 
		t[1] *           256 +
		t[2]
    return n-32768
end
local function l2b(x)
	return x%4
end
local function u14b(x)
	return math.floor(x/4)
end

local ndb={}

--local variables for performance
local ndb_nodeids={}
local ndb_nodes={}

local function ndbget(x,y,z)
	local ny=ndb_nodes[y]
	if ny then
		local nx=ny[x]
		if nx then
			return nx[z]
		end
	end
	return nil
end
local function ndbset(x,y,z,v)
	if not ndb_nodes[y] then
		ndb_nodes[y]={}
	end
	if not ndb_nodes[y][x] then
		ndb_nodes[y][x]={}
	end
	ndb_nodes[y][x][z]=v
end


local path="advtrains_ndb2"
--load
--nodeids get loaded by advtrains init.lua and passed here
function ndb.load_data(data)
	ndb_nodeids = data and data.nodeids or {}
	local file, err = io.open(path, "rb")
	if not file then
		print("Couldn't load the node database: " .. err or "Unknown Error")
	else
		local cnt=0
		local hst_z=file:read(2)
		local hst_y=file:read(2)
		local hst_x=file:read(2)
		local cid=file:read(2)
		while hst_z and hst_y and hst_x and cid and #hst_z==2 and #hst_y==2 and #hst_x==2 and #cid==2 do
			ndbset(bytes_to_int(hst_x), bytes_to_int(hst_y), bytes_to_int(hst_z), bytes_to_int(cid))
			cnt=cnt+1
			hst_z=file:read(2)
			hst_y=file:read(2)
			hst_x=file:read(2)
			cid=file:read(2)

			local param2 = l2b(bytes_to_int(cid))
			local contentid = u14b(bytes_to_int(cid))
			local x = bytes_to_int(hst_x)
			local y = bytes_to_int(hst_y)
			local z = bytes_to_int(hst_z)


			print("x: " .. x .. " y: " .. y .. " z: " .. z .. " cid: " .. contentid .. " param2: " .. param2)
		end
		print("nodedb: read " .. cnt .. " nodes.")
		file:close()
	end
end

ndb.load_data()
