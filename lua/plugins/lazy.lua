return {
"kdheepak/lazygit.nvim",
lazy = true,
cmd = {
"LazyGit",
"LazyGitConfig",
"LazyGitCurrentFile",
"LazyGitFilter",
"LazyGitFilterCurrentFile",
},
dependencies = { "nvim-lua/plenary.nvim" }, -- optional for floating window border decoration
keys = {
{ "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" }
}
}
