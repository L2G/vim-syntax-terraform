" Vim syntax file
" Language: Terraform (http://terraform.io)
" Maintainer: Larry Gilbert
" Last update: 2014-08-09
"
" Thanks to OpenLogic for their syntax-highlighting primer
" (http://www.openlogic.com/wazi/bid/188101/Create-Your-Own-Syntax-
" Highlighting-in-Vim)

if exists("b:current_syntax")
  finish
endif

syn case match

syn keyword TfSection connection output provider variable
syn keyword TfValueBool true false on off yes no

""" resource

" find . -name "resource_*.go" -not -name "resource_*_test.go" -not -name "resource_provider.go" | sed 's/.*\/resource_//; s/\.go$//'
syn keyword TfResourceType
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
          \ contained transparent

syn match  TfResource        /resource/ nextgroup=TfResourceTypeStr skipwhite
syn region TfResourceTypeStr start=/"/ end=/"/ contains=TfResourceType
                           \ nextgroup=TfResourceBlock skipwhite
syn region TfResourceBlock   start=/{/ end=/}/ contained

""" misc.

syn match  TfCommentSingle "#.*$"
syn match  TfValueDec      "\<[0-9]\+\([kKmMgG]b\?\)\?\>"
syn match  TfValueHexaDec  "\<0x[0-9a-f]\+\([kKmMgG]b\?\)\?\>"

syn region TfCommentMulti      start=/\/\*/ end=/\*\//
syn region TfValueString       start=/"/    end=/"/    contains=TfStringInterp
syn region TfValueStringInterp start=/\${/  end=/}/    contained

highlight link TfCommentSingle     Comment
highlight link TfCommentMulti      Comment
highlight link TfResource          Structure
highlight link TfResourceTypeStr   Identifier
highlight link TfSection           Structure
highlight link TfValueString       String
highlight link TfValueStringInterp Underlined
highlight link TfValueBool         Boolean
highlight link TfValueDec          Number
highlight link TfValueHexaDec      Number

let b:current_syntax = "terraform"
