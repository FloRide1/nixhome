local function load(plugin)
    dofile(path .. "/lsp/" .. plugin .. ".lua")
end

local plugins = {
    'lsp',
    'lsp_jdtls',
    'lspsaga',
}

for _,plugin in ipairs(plugins) do
    load(plugin)
end
