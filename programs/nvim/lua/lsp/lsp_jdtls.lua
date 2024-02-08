local home = os.getenv('HOME')
local workspace_folder = home .. "/.local/share/eclipse/" .. vim.fn.fnamemodify(root_dir, ":p:h:t")

local launcher_jar_path = vim.fn.globpath(home .. '/.local/share/nvim/mason/packages/jdtls/plugins', 'org.eclipse.equinox.launcher_*.jar', false, true)[1]

require'lspconfig'.jdtls.setup {
    cmd = {
        'java', 
        '-Declipse.application=org.eclipse.jdt.ls.core.id1',
        '-Dosgi.bundles.defaultStartLevel=4',
        '-Declipse.product=org.eclipse.jdt.ls.core.product',
        '-Dlog.protocol=true',
        '-Dlog.level=ALL',
        '-Xms1g',
        '-javaagent:'.. home .. '/.local/share/nvim/mason/packages/jdtls/lombok.jar',
        '-jar', launcher_jar_path,
        '-configuration', home .. '/.local/share/nvim/mason/packages/jdtls/config_linux',
        '-data', workspace_folder,
        '--add-modules=ALL-SYSTEM',
        '--add-opens', 'java.base/java.util=ALL-UNNAMED',
        '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
    },
}
