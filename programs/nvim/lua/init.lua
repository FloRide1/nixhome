local function load(plugin)
    dofile(path .. "/" .. plugin .. ".lua")
end

local subdirs = {
    'ui/',
    'lsp/',
    'dap/',
    'cmp/',
    'others/',
}

for _,subdir in ipairs(subdirs) do
    load(subdir .. "init")
end
