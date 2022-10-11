local util = require("lspconfig/util")

return {
  on_setup = function(server)
    server:setup({
      capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
      flags = {
        debounce_text_changes = 150,
      },
      cmd = { "gopls", "serve" },
      filetypes = { "go", "gomod" },
      root_dir = util.root_pattern("go.work"),
      settings = {
        gopls = {
          analyses = {
            unusedparams = true,
          },
          staticcheck = true,
        },
      },
      on_attach = function(client, bufnr)
        local function buf_set_keymap(...)
          vim.api.nvim_buf_set_keymap(bufnr, ...)
        end

        -- 绑定快捷键
        require("keybindings").mapLSP(buf_set_keymap)
      end,
    })
  end,
}
