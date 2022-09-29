let g:asyncomplete_auto_completeopt = 0
let g:asyncomplete_min_chars = 1
let g:lsp_signature_help_enabled = 0
let g:lsp_document_highlight_enabled = 0
let g:lsp_completion_documentation_enabled = 0
let g:lsp_diagnostics_highlights_enabled = 0
let g:lsp_diagnostics_signs_insert_mode_enabled = 0

call asyncomplete#register_source(asyncomplete#sources#buffer#get_source_options({
			\ 'name': 'buffer',
			\ 'allowlist': ['*'],
			\ 'blocklist': ['go'],
			\ 'completor': function('asyncomplete#sources#buffer#completor'),
			\ 'config': {
			\    'max_buffer_size': 5000000,
			\    'clear_cache': 1,
			\    'min_word_len': 3,
			\  },
			\ }))

if executable('html-languageserver')
	au User lsp_setup call lsp#register_server({
				\ 'name': 'html-languageserver',
				\ 'cmd': {server_info->[&shell, &shellcmdflag, 'html-languageserver --stdio']},
				\ 'whitelist': ['html'],
				\ })
endif

if executable('css-languageserver')
	au User lsp_setup call lsp#register_server({
				\ 'name': 'css-languageserver',
				\ 'cmd': {server_info->[&shell, &shellcmdflag, 'css-languageserver --stdio']},
				\ 'whitelist': ['css', 'less', 'sass'],
				\ })
endif

if executable('typescript-language-server')
	au User lsp_setup call lsp#register_server({
				\ 'name': 'javascript support using typescript-language-server',
				\ 'cmd': { server_info->[&shell, &shellcmdflag, 'typescript-language-server --stdio']},
				\ 'root_uri': { server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_directory(lsp#utils#get_buffer_path(), '.git/..'))},
				\ 'whitelist': ['javascript', 'javascript.jsx', 'javascriptreact']
				\ })
endif

if executable('intelephense')
	augroup LspPHPIntelephense
		au!
		au User lsp_setup call lsp#register_server({
					\ 'name': 'intelephense',
					\ 'cmd': {server_info->[&shell, &shellcmdflag, 'intelephense --stdio']},
					\ 'whitelist': ['php'],
					\ 'workspace_config': {
					\   'intelephense': {
					\     'files': {
					\       'maxSize': 1000000,
					\       'associations': ['*.php', '*.phtml'],
					\       'exclude': [],
					\     },
					\     'completion': {
					\       'insertUseDeclaration': v:true,
					\       'fullyQualifyGlobalConstantsAndFunctions': v:false,
					\       'triggerParameterHints': v:true,
					\       'maxItems': 100,
					\     },
					\     'format': {
					\       'enable': v:true
					\     },
					\   },
					\ }
					\})
	augroup END
endif

function! s:on_lsp_buffer_enabled() abort
	setlocal omnifunc=lsp#complete
	if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
	nmap <buffer> gD <plug>(lsp-declaration)
	nmap <buffer> gd <plug>(lsp-definition)
	nmap <buffer> gr <plug>(lsp-references)
	nmap <buffer> gi <plug>(lsp-implementation)
	nmap <buffer> gt <plug>(lsp-type-definition)
	nmap <buffer> <leader>g <plug>(lsp-document-diagnostics)<CR>
	nmap <buffer> [g <plug>(lsp-previous-diagnostic)
	nmap <buffer> ]g <plug>(lsp-next-diagnostic)
	nmap <buffer> K <plug>(lsp-hover)
endfunction

augroup lsp_install
	au!
	" call s:on_lsp_buffer_enabled only for languages that has the server registered.
	autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END
