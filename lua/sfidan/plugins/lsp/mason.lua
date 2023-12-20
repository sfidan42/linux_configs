-- import mason plugin safely
local mason_status, mason = pcall(require, "mason")
if not mason_status then
  return
end

-- import mason-lspconfig plugin safely
local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status then
  return
end

-- import mason-null-ls plugin safely
local mason_null_ls_status, mason_null_ls = pcall(require, "mason-null-ls")
if not mason_null_ls_status then
  return
end

-- enable mason
mason.setup()

mason_lspconfig.setup({
  -- list of servers for mason to install
  ensure_installed = {
    "clangd", -- C/C++ls
--    "csharp-language-server", -- C#ls
--    "lua-language-server", -- luals
--    "bash-language-server", -- bashls
--    "docker-compose-language-server", -- dockercomposels
--    "dockerfile-language-server", -- dockerls
--    "java-language-server", -- javals
--    "pyright", -- 
--    "python-lsp-server", -- pyls
    -- Add other language servers as needed
  },
  -- auto-install configured servers (with lspconfig)
  automatic_installation = true,
})

mason_null_ls.setup({
  -- list of formatters & linters for mason to install
  ensure_installed = {
    "clang_format",  -- C/C++ formatter
--    "google-java-format", -- java formatter
--    "stylue", -- lua formatter
--    "csharpier", -- C# formatter
--    "shellharden",
--    "pyink",
    -- Add other formatters & linters as needed
  },
  -- auto-install configured formatters & linters (with null-ls)
  automatic_installation = true,
})
