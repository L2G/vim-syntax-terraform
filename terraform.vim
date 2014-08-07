" Vim syntax file
" Language: Terraform (http://terraform.io)
" Maintainer: Larry Gilbert
" Last update: 2014-08-07
"
" Thanks to OpenLogic
" (http://www.openlogic.com/wazi/bid/188101/Create-Your-Own-Syntax-Highlighting-in-Vim)

if exists("b:current_syntax")
  finish
endif

syn case match

syn keyword TfSection connection output provider resource variable
syn keyword TfValueBool true false on off yes no

syn match   TfCommentSingle "#.*$"
syn match   TfValueDec      "\<[0-9]\+\([kKmMgG]b\?\)\?\>"
syn match   TfValueHexaDec  "\<0x[0-9a-f]\+\([kKmMgG]b\?\)\?\>"

syn region TfCommentMulti      start=/\/\*/ end=/\*\//
syn region TfValueString       start=/"/    end=/"/    contains=TfStringInterp
syn region TfValueStringInterp start=/\${/  end=/}/    contained

highlight link TfCommentSingle     Comment
highlight link TfCommentMulti      Comment
highlight link TfSection           Structure
highlight link TfValueString       String
highlight link TfValueStringInterp Underlined
highlight link TfValueBool         Boolean
highlight link TfValueDec          Number
highlight link TfValueHexaDec      Number

let b:current_syntax = "terraform"
