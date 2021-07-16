let g:vimwiki_list = [{'path': '~/wiki/', 'syntax': 'markdown', 'ext': '.md'}, {'path':'~/wiki/'}]
let g:zettel_format = "%Y-%m-%d-%H%M-%title"
let g:zettel_options = [{"template" :  "~/wiki/mytemplate.tpl"}]
let g:zettel_fzf_command = "rg --column --line-number --ignore-case --no-heading --color=always"
