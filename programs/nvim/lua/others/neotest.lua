require("neotest").setup({
    adapters = {
        require("neotest-plenary"),
        require("neotest-dotnet"),
        require("neotest-rust"),
        require("neotest-vim-test")({
            ignore_file_types = { "vim" },
        }),
    },

    icons = {
        expanded = "",
        child_prefix = "",
        child_indent = "",
        final_child_prefix = "",
        non_collapsible = "",
        collapsed = "",
        passed = "",
        running = "",
        failed = "",
        unknown = "",
    },
})
