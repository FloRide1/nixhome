local function load(plugin)
    dofile(path .. "/ui/" .. plugin .. ".lua")
end

local plugins = {
    'ui',
    'trouble',
    'gitsigns',
}

for _,plugin in ipairs(plugins) do
    load(plugin)
end

