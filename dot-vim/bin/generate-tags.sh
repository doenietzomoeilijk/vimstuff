#!/bin/bash
/usr/bin/ctags \
  -f /home/max/.vim/tags/php.tags \
  -h ".php" \
  -R \
  --exclude=".git" \
  --exclude=".svn" \
  --exclude=".AppleDouble" \
  --tag-relative=no \
  --PHP-kinds=+icf-v \
  --totals=no \
  --verbose=no \
  /home/max/repos/hotelmodules/PHPClasses/php_rewritten/*
