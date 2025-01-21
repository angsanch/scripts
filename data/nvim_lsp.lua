-- Danis cool config

lspconfig.hls.setup {
	on_attach = on_attach,
	on_init = on_init,
	capabilities = capabilities,
	filetypes = { 'haskell', 'lhaskell', 'cabal' },
}

lspconfig.clangd.setup {
    cmd = { "clangd" }, -- Use system-installed clangd
    filetypes = { "c", "cpp", "objc", "objcpp" },
    root_dir = function(fname)
        return lspconfig.util.root_pattern("compile_commands.json", ".git")(fname) or lspconfig.util.path.dirname(fname)
    end,
    capabilities = capabilities,
    on_attach = on_attach,
}
