return {
    "chrisgrieser/nvim-spider",
    lazy = true,
    keys = {
        {
            "e",
            "<cmd>lua require('spider').motion('e')<CR>",
            mode = { "n", "x" },
        },
        {
            "w",
            "<cmd>lua require('spider').motion('w')<CR>",
            mode = { "n", "x" },
        },
        {
            "b",
            "<cmd>lua require('spider').motion('b')<CR>",
            mode = { "n", "x" },
        },
    },
    config = function()
        require("spider").setup({
            skipInsignificantPunctuation = true,
            consistentOperatorPending = false, -- see "Consistent Operator-pending Mode" in the README
            subwordMovement = true,
            customPatterns = {}, -- check "Custom Movement Patterns" in the README for details
        })
    end,
}
