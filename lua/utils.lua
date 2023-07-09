-- source: https://gist.github.com/Zbizu/43df621b3cd0dc460a76f7fe5aa87f30
function GetOS()
  -- ask LuaJIT first
  if jit then
    return jit.os
  end

  -- Unix, Linux variants
  local fh = assert(io.popen("uname -o 2>/dev/null","r"))
  local osname

  if fh then
    osname = fh:read()
  end

  return osname or "Windows"
end

function Color()
  vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
  -- vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
end
