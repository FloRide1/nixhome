local function load(plugin)
    dofile(path .. "/others/" .. plugin .. ".lua")
end

local plugins = {
    'telescope-nvim',
    'neotest',
    'mason',
    'which_key',
}

for _,plugin in ipairs(plugins) do
    load(plugin)
end

