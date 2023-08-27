local p_window = require "telescope.pickers.window"
local layout_strategies = require('telescope.pickers.layout_strategies')

layout_strategies.habahiro = function(self, max_columns, max_lines, layout_config)
  local initial_options = p_window.get_initial_window_options(self)
  local results = initial_options.results
  local prompt = initial_options.prompt
  local preview = initial_options.preview

  local xpadding = 2

  local single_column = self.layout_config.force_single_column or max_columns < 140
  local height = math.min(max_lines - 2, 35)
  local width = max_columns - 2 - xpadding * 2

  prompt.height = 1
  prompt.line = (max_lines - height) / 2 + 2
  results.line = prompt.line + 2
  prompt.col = 2 + xpadding
  results.col = prompt.col

  prompt.border = { 1, 1, 0, 1 }

  if not self.previewer then
    results.height = height

    prompt.width = math.min(width, 70)
    results.width = prompt.width

    prompt.col = math.max(2 + xpadding, math.floor((max_columns - prompt.width) / 2))
    results.col = prompt.col

    prompt.borderchars =  { "═", "║", " ", "║", "╔", "╗", " ", " " }
    results.borderchars = { "═", "║", "═", "║", "╠", "╣", "╝", "╚" }
  elseif single_column then
    results.height = math.floor(height * 0.6)
    preview.height = height - (results.height + 4)

    prompt.width = width
    results.width = prompt.width
    preview.width = prompt.width

    preview.line = prompt.line + results.height + 3
    preview.col = prompt.col

    results.border = { 1, 1, 0, 1 }
    prompt.borderchars =  { "═", "║", " ", "║", "╔", "╗", " ", " " }
    results.borderchars = { "═", "║", "═", "║", "╠", "╣", "╣", "╠" }
    preview.borderchars = { "═", "║", "═", "║", "╠", "╣", "╝", "╚" }
  else
    results.height = height - 3
    preview.height = height - 1

    prompt.width = math.min(math.floor(max_columns * 1.4), 60) - xpadding
    results.width = prompt.width
    preview.width = max_columns - prompt.width - 3 - xpadding * 2

    preview.line = prompt.line
    preview.col = prompt.width + 3 + xpadding

    preview.border = { 1, 1, 1, 0 }
    prompt.borderchars =  { "═", "║", " ", "║", "╔", "╦", " ", " " }
    results.borderchars = { "═", "║", "═", "║", "╠", "╣", "╩", "╚" }
    preview.borderchars = { "═", "║", "═", "║", "╔", "╗", "╝", "╚" }
  end

  return {
    preview = self.previewer and preview.width > 0 and preview,
    prompt = prompt,
    results = results,
  }
end
