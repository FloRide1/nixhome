function load(plugin)
    dofile(path .. "/dap/" .. plugin .. ".lua")
end

local plugins = {
    'dap',
    'dapui',
    'dap_csharp',
}

for _,plugin in ipairs(plugins) do
    load(plugin)
end

