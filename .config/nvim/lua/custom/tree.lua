require("nvim-tree").setup(
    {
        view = {
            side = "right",
            signcolumn = "no"
        },
        renderer = {
            root_folder_modifier = "",
            icons = {
                show = {
                    file = false,
                    folder = false,
                    git = false
                }
            }
        }
    }
)
