" Vim syntax file
" Language:             Vyper (https://github.com/ethereum/vyper)
" Author:               chgue (https://github.com/chgue)
" URL:                  https://github.com/chgue/vim-viper
" Last Change:          2019-06-06
" Filenames:            *.vy

if exists("b:current_syntax")
  finish
endif

"Keywords
syn keyword vyperBoolean True False
syn keyword vyperBuiltin struct event self implements interface
syn keyword vyperConditional if else elif
syn keyword vyperConstant ZERO_ADDRESS EMPTY_BYTES32 MAX_INT128 MIN_INT128 MAX_DECIMAL MIN_DECIMAL MAX_UINT256
syn keyword vyperDecorator from import
syn keyword vyperEnvironment msg tx block
syn keyword vyperNatspec @title @licence @author @notice @dev @param @return @version
syn keyword vyperOperator and not or
syn keyword vyperRepeat for while in
syn keyword vyperSpecial return pass continue break log
syn keyword vyperStatement contract def nextgroup=vyperFunction skipwhite
syn keyword vyperStatement public private internal indexed view constant assert raise
syn keyword vyperTodo TODO FIXME NOTE XXX contained
syn keyword vyperTypes address bool decimal num bytes32 int128 uint256 Bytes String HashMap

"Functions
syn match vyperFunction "[a-zA-Z_][a-zA-Z0-9_]*" display contained
syn match vyperFunction "\w\+\ze(" display

"Operators
syn match vyperOperator "\(=\|+\|-\|*\|\/\|%\|!\|<\|>\)"

"Decorators
syn match vyperDecorator "@" display nextgroup=vyperDecoratorName skipwhite
syn match vyperDecoratorName "\(payable\|constant\|internal\|public\|external\|view\|pure\|nonreentrant\)$" display contained

"Natspec
syn match vyperNatspec "@\w\+" display nextgroup=vyperNatspec contained

"Comments
syn match vyperComment "#.*$" contains=vyperTodo,vyperNatspec

"Literals
syn match vyperNumber "\<\d\>" display
syn match vyperNumber "\<[1-9]\d\+\>" display
syn match vyperNumberError "\<0\d\+\>" display
syn match vyperAddress "\<0x\x\{40}\>" display
syn match vyperAddressError "\<0x\x\{0,39}\>" display
syn match vyperAddressError "\<0x\x\{41,}\>" display
syn match vyperAddressError "\<0x\x*\X\+.\+\>" display
syn match vyperDecimal "\<\d*\.\d\+\>" display
"String (String inside a string doesn't work properly!)
syn match vyperString +".\{-}"+ display
syn match vyperString +'.\{-}'+ display
"Docstrings
syn region vyperString start=+[uU]\=\z('''\|"""\)+ end="\z1" contains=vyperTodo,vyperNatspec keepend

syn match vyperStringError +".\{-}'+ display
syn match vyperStringError +'.\{-}"+ display

"We need to sync at each def so that docstrings don't spill into other methods
syn sync match vyperSync grouphere NONE "^\%(def\)\s\+\h\w*\s*[(:]"

"Highlighting
hi link vyperStatement Statement
hi link vyperConditional Conditional
hi link vyperConstant Function
hi link vyperRepeat Repeat
hi link vyperOperator Operator
hi link vyperBoolean Boolean
hi link vyperDecorator Define
hi link vyperDecoratorName Function
hi link vyperNatspec Special
hi link vyperSpecial Special
hi link vyperEnvironment Boolean
hi link vyperComment Comment
hi link vyperTypes Type
hi link vyperNumber Number
hi link vyperAddress Number
hi link vyperAddressError Error
hi link vyperDecimal Float
hi link vyperFunction Function
hi link vyperBuiltin Function
hi link vyperStringError Error
hi link vyperString String
hi link vyperTodo todo
