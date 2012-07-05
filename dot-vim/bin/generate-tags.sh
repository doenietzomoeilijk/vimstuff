#!/bin/bash
# cd /usr/share/php/Zend
cd /
# ctags -f ~/.vim/tags/Zend.tags -h ".php" -R --exclude=".git" --exclude=".svn" --tag-relative=yes --PHP-kinds=+cf-v --totals=yes /usr/share/php/Zend*
ctags -f ~/.vim/tags/php.tags -h ".php" -R --exclude=".git" --exclude=".svn" --tag-relative=yes --PHP-kinds=+cf-v --totals=yes -V /home/max/repos/hotelmodules/PHPClasses/php_rewritten/*
