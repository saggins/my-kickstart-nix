-- if the executable not in path, then alt f4
if vim.fn.executable('marksman') ~= 1 then
  return
end

local root_files = {
  '.git'
}

vim.lsp.start {
  name = 'marksman_ls',
  cmd = {'marksman'},
  root_dir = vim.fs.dirname(vim.fs.find(root_files, { upward  = true} )[1]),
  capabilities = require( 'user.lsp').make_client_capabilities(),
}
