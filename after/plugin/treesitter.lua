local ok, treesitter = pcall(require, "nvim-treesitter")
if not ok then
  return
end

treesitter.setup({})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function(args)
    pcall(vim.treesitter.start, args.buf)
  end,
})

local textobjects_ok, textobjects = pcall(require, "nvim-treesitter-textobjects")
if textobjects_ok then
  textobjects.setup({
    select = {
      lookahead = true,
      selection_modes = {
        ["@parameter.outer"] = "v",
        ["@function.outer"] = "V",
        ["@class.outer"] = "<c-v>",
      },
      include_surrounding_whitespace = true,
    },
  })

  local select = require("nvim-treesitter-textobjects.select")

  local function map_textobject(lhs, query, query_group, desc)
    vim.keymap.set({ "x", "o" }, lhs, function()
      select.select_textobject(query, query_group)
    end, { desc = desc })
  end

  map_textobject("af", "@function.outer", "textobjects", "Select outer function")
  map_textobject("if", "@function.inner", "textobjects", "Select inner function")
  map_textobject("ac", "@class.outer", "textobjects", "Select outer class")
  map_textobject("ic", "@class.inner", "textobjects", "Select inner class")
  map_textobject("as", "@local.scope", "locals", "Select language scope")
end

require("treesitter-context").setup({
  enable = true,
  max_lines = 0,
  min_window_height = 0,
  line_numbers = true,
  multiline_threshold = 1,
  trim_scope = "outer",
  mode = "topline",
  separator = nil,
  zindex = 20,
  on_attach = nil,
})
