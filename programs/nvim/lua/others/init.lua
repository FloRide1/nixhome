local function load(plugin)
    dofile(path .. "/others/" .. plugin .. ".lua")
end

local plugins = {
    'neotest',
    'mason',
}

for _,plugin in ipairs(plugins) do
    load(plugin)
end

