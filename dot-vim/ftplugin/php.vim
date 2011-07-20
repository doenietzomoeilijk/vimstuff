setlocal makeprg=php\ -lq\ %
" setlocal errorformat=%m\ in\ %f\ on\ line\ %l
setlocal errorformat='%-GNo syntax errors detected in%.%#,PHP Parse error: %#syntax %trror\, %m in %f on line %l,PHP Fatal %trror: %m in %f on line %l,%-GErrors parsing %.%#,%-G\s%#,Parse error: %#syntax %trror\, %m in %f on line %l,Fatal %trror: %m in %f on line %l'

