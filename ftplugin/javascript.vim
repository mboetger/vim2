if exists('&ofu')
    setlocal omnifunc=nodejscomplete#CompleteJS
endif

let g:nodejs_complete_config = {
	    \  'js_compl_fn': 'jscomplete#CompleteJS',
	    \  'max_node_compl_len': 15
	    \}