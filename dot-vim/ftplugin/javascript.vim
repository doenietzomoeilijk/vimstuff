setlocal makeprg=jsl\ -nofilelisting\ -nocontext\ -nosummary\ -nologo\ -conf\ ~/.vim/ftplugin/jslint.cfg\ -process\ %
setlocal errorformat="%f(%l):%m","%p^"
