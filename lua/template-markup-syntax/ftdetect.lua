local M = {}

-- Convert glob pattern to Lua pattern for matching
-- Handles: ** (any path), * (any filename chars), literal chars
local function glob_to_pattern(glob)
  -- Escape Lua pattern special characters except * and ?
  local pattern = glob:gsub("([%.%+%-%^%$%(%)%[%]%%])", "%%%1")
  -- Convert **/ to match any path prefix (including empty)
  pattern = pattern:gsub("%*%*/", ".-")
  -- Convert /** to match any path suffix (including empty)
  pattern = pattern:gsub("/%*%*", ".-")
  -- Convert remaining ** to match any characters
  pattern = pattern:gsub("%*%*", ".-")
  -- Convert * to match anything except /
  pattern = pattern:gsub("%*", "[^/]*")
  -- Anchor at end
  pattern = pattern .. "$"
  return pattern
end

-- Check if a path matches any of the configured patterns
function M.matches(path, patterns)
  for _, glob in ipairs(patterns) do
    local lua_pattern = glob_to_pattern(glob)
    if path:match(lua_pattern) then
      return true
    end
  end
  return false
end

function M.setup(patterns)
  -- Store patterns for matching
  M.patterns = patterns

  -- Use vim.filetype.add for proper filetype detection
  vim.filetype.add({
    pattern = {
      [".*"] = {
        priority = -math.huge,
        function(path)
          if M.matches(path, M.patterns) then
            return "tml"
          end
          return nil
        end,
      },
    },
  })
end

return M
