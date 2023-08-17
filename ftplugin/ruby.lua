vim.opt.makeprg = "rspec --require=~/.config/nvim/support/rspec_quickfix_formatter.rb % 2> /dev/null"

vim.opt.errorformat = "[E%t] %f:%l:%m"

vim.keymap.set("n", "<leader>x", function() vim.cmd("Make") end, { desc = "Run RSpec on current file" })
