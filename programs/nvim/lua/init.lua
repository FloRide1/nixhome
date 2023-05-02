local function load(plugin)
    dofile(path .. "/" .. plugin .. ".lua")
end

local subdirs = {
    'others/',
    'ui/',
    'lsp/',
    'dap/',
    'cmp/',
}

for _,subdir in ipairs(subdirs) do
    load(subdir .. "init")
end
