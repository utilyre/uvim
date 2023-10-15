local icon = require("uvim.icon")

local spec = {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = { "Telescope" },
    keys = { "<leader>fr", "<leader>ff", "<leader>fw" },
}

function spec:config()
    local telescope = require("telescope")
    local builtin = require("telescope.builtin")

    telescope.setup({
        defaults = {
            sorting_strategy = "ascending",
            file_ignore_patterns = { "^.git/", "/.git/" },
            path_display = { "truncate" },
            prompt_prefix = icon.widget.telescope .. " ",
            selection_caret = "  ",
            borderchars = { " ", " ", " ", " ", " ", " ", " ", " " },
            layout_config = {
                prompt_position = "top",
            },
            mappings = {
                i = {
                    ["<s-tab>"] = "move_selection_previous",
                    ["<tab>"] = "move_selection_next",
                },
            },
        },
        pickers = {
            find_files = {
                hidden = true,
            },
            live_grep = {
                disable_coordinates = true,
            },
        },
    })

    vim.keymap.set("n", "<leader>fr", builtin.resume)
    vim.keymap.set("n", "<leader>ff", builtin.find_files)
    vim.keymap.set("n", "<leader>fw", builtin.live_grep)
end

return spec
