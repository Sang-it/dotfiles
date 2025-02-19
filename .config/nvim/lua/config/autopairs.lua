require("nvim-autopairs").setup(
    {
        check_ts = true,
        disable_filetype = {
            "TelescopePrompt"
        },
        fast_wrap = {
            map = "<C-e>",
            chars = { "{", "[", "(", '"', "'" },
            pattern = [=[[%'%"%)%>%]%)%}%,]]=],
            end_key = "$",
            offset = 0,
            keys = "aoeuidhtns",
            check_comma = true,
            highlight = "Search",
            highlight_grey = "Comment"
        }
    }
)

local cmp_autopairs = require("nvim-autopairs.completion.cmp")
local cmp = require("cmp")
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({ map_char = { tex = "" } }))
