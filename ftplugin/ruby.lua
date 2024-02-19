vim.opt.makeprg = "bundle exec rspec --require=~/.config/nvim/support/rspec_quickfix_formatter.rb %"

vim.opt.errorformat = " %#[E%t] %f:%l:%m"

vim.keymap.set("n", "<leader>*", function() vim.cmd("Make") end, { desc = "Run RSpec on current file" })
