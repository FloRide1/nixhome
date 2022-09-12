function load(plugin)
    dofile(path .. "/" .. plugin .. ".lua")
end

local plugins = {
}

local subdirs = {
}

for _,plugin in ipairs(plugins) do
    load(plugin)
end

for _,subdir in ipairs(subdirs) do
    load(subdir)
end
