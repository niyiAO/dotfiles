function map(keys, cmd, mode, opts)
  opts = opts or {
    noremap = true,
    silent = true
  }

  mode = mode or ''

  vim.api.nvim_set_keymap(mode, keys, cmd, opts)
end

function nmap(keys, cmd)
  map(keys, cmd, 'n')
end

function imap(keys, cmd)
  map(keys, cmd, 'i')
end

function vmap(keys, cmd)
  map(keys, cmd, 'v')
end

function bootstrap_lazyvim()
  local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

  if not vim.loop.fs_stat(lazypath) then
    print("Installing lazy.nvim to " .. lazypath)
    
    vim.fn.system({
      "git",
      "clone",
      "--filter=blob:none",
      "https://github.com/folke/lazy.nvim.git",
      "--branch=stable",
      lazypath,
    })
  end

  vim.opt.rtp:prepend(lazypath)
end