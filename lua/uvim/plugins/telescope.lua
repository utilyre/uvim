local Binder = require("uvim.Binder")
local icon = require("uvim.icon")

local spec = {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = { "Telescope" },
    keys = {
        "<leader>fr",
        "<leader>ft",
        "<leader>ff",
        "<leader>fw",
    },
}

function spec:config()
    local telescope = require("telescope")
    local themes = require("telescope.themes")
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
                width = 100,
                height = 25,
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

    local binder = Binder.new():with_modes({ "n" })
    binder:bind("<leader>fr", builtin.resume)
    binder:bind("<leader>ft", builtin.filetypes)
    binder:bind("<leader>ff", builtin.find_files)
    binder:bind("<leader>fw", builtin.live_grep)
end

return spec
