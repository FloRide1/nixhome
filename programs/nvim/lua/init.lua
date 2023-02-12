function load(plugin)
    dofile(path .. "/" .. plugin .. ".lua")
end

local subdirs = {
    'lsp',
}

for _,subdir in ipairs(subdirs) do
    load(subdir .. "/init")
end
