local icon = require("uvim.icon")

local spec = {
    "nvim-telescope/telescope.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    cmd = "Telescope",
    keys = { "<space>fr", "<space>ff", "<space>fw" },
}

spec.opts = {
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
}

function spec:config(opts)
    local telescope = require("telescope")
    local builtin = require("telescope.builtin")

    telescope.setup(opts)

    vim.api.nvim_set_hl(0, "TelescopeNormal", { link = "NormalFloat" })

    vim.keymap.set("n", "<space>fr", builtin.resume)
    vim.keymap.set("n", "<space>ff", builtin.find_files)
    vim.keymap.set("n", "<space>fw", builtin.live_grep)
end

return spec
