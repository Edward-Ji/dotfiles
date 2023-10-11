return {
    "danymat/neogen",
    dependencies = "nvim-treesitter/nvim-treesitter",
    config = {
        enabled = true,
        languages = {
            python = {
                template = {
                    annotation_convention = "reST"
                }
            }
        }
    },
    cmd = "Neogen",
    keys = {
        {"<Leader>nf", ":lua require('neogen').generate()<CR>", "Neogen generate"}
    }
}
