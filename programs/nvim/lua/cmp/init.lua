local function load(plugin)
    dofile(path .. "/cmp/" .. plugin .. ".lua")
end

local plugins = {
    'cmp',
}

for _,plugin in ipairs(plugins) do
    load(plugin)
end

