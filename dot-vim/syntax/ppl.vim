" Vim syntax file
" Language:		ppl
" Maintainer:	Max
" Last Change:	sep 20, 2010

syn case ignore

syn keyword pplOp and or not
hi def link pplOp Operator

syn keyword pplCon when When
hi def link pplCon Conditional

syn keyword pplKW raises folds bets calls lastraiserposition stackSize
syn keyword pplKW lastcallerposition hand bigBlindSize stillToAct botsLastAction
syn keyword pplKW TotalInvested opponentsAtTable opponentIsAllIn amountToCall betSize
syn keyword pplKW amSmallBlind pairinhand amBigBlind minOpponentStackSize
syn keyword pplKW opponents position board potSize totalinvested overcards
syn keyword pplKW callsSinceLastRaise
syn match pplKW "\cin Button"
syn match pplKW "\c\S\+\(On\|Before\)\(Flop\|Turn\|River\)"
syn match pplKW "\c\<have\S\+\>"
syn match pplKW "\c\<nut\S\+\>"
syn match pplKW "\c\<\S\+possible\>"
syn match pplKW "\c\<\S\+onboard\>"
syn match pplKW "\c\<\S\+inhand\>"
syn match pplKW "\c\<bot\S\+\>"
hi def link pplKW Function

syn match pplCard "\<\(\d\|T\|J\|Q\|K\|A\)\+\(%\|+\|s\)\?\>"
hi def link pplCard Number

syn match pplResult "\c\<\(raise\|call\|raisemax\|raisemin\|fold\|force\|bet\)\( \d\+%\)\? force\>"
hi def link pplResult String

" --- Comment ---
syn match   scptComment "//.*"
hi def link scptComment Comment

" --- Todo ---
syn keyword scptTodo contained TODO FIXME XXX
hi def link scptTodo Todo

let b:current_syntax = "ppl"
