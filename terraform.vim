" Vim syntax file
" Language: Terraform (http://terraform.io)
" Maintainer: Larry Gilbert <larry@L2G.to>
" Last Change: 2014-08-09
"
" Thanks to OpenLogic for their syntax-highlighting primer
" (http://www.openlogic.com/wazi/bid/188101/Create-Your-Own-Syntax-
" Highlighting-in-Vim)

if exists("b:current_syntax")
  finish
endif

syn case match

syn keyword terraSection connection output provider variable
syn keyword terraValueBool true false on off yes no

""" resource

" find . -name "resource_*.go" -not -name "resource_*_test.go" -not -name "resource_provider.go" | sed 's/.*\/resource_//; s/\.go$//'
syn keyword terraResourceTypeBI
          \ aws_autoscaling_group           aws_security_group
          \ aws_db_instance                 aws_subnet
          \ aws_db_security_group           aws_vpc
          \ aws_eip                         cloudflare_record
          \ aws_elb                         consul_keys
          \ aws_instance                    digitalocean_domain
          \ aws_internet_gateway            digitalocean_droplet
          \ aws_launch_configuration        digitalocean_record
          \ aws_route53_record              dnsimple_record
          \ aws_route53_zone                heroku_addon
          \ aws_route_table                 heroku_app
          \ aws_route_table_association     heroku_domain
          \ aws_s3_bucket                   heroku_drain
          \
          \ contained

syn match  terraResource        /resource/ nextgroup=terraResourceTypeStr skipwhite
syn region terraResourceTypeStr start=/"/ end=/"/ contains=terraResourceTypeBI
                              \ nextgroup=terraResourceName skipwhite
syn region terraResourceBlock   start=/{/ end=/}/ contained fold
syn region terraResourceName    start=/"/ end=/"/
                              \ nextgroup=terraResourceBlock skipwhite

""" misc.

syn match  terraCommentSingle "#.*$"
syn match  terraValueDec      "\<[0-9]\+\([kKmMgG]b\?\)\?\>"
syn match  terraValueHexaDec  "\<0x[0-9a-f]\+\([kKmMgG]b\?\)\?\>"

syn region terraCommentMulti      start=/\/\*/ end=/\*\//
syn region terraValueString       start=/"/    end=/"/    contains=terraStringInterp
syn region terraValueStringInterp start=/\${/  end=/}/    contained

highlight link terraCommentSingle     Comment
highlight link terraCommentMulti      Comment
highlight link terraResource          Structure
highlight link terraResourceBlock     Delimiter
highlight link terraResourceName      String
highlight link terraResourceTypeBI    Tag
highlight link terraResourceTypeStr   String
highlight link terraSection           Structure
highlight link terraValueString       String
highlight link terraValueStringInterp Underlined
highlight link terraValueBool         Boolean
highlight link terraValueDec          Number
highlight link terraValueHexaDec      Number

let b:current_syntax = "terraform"
