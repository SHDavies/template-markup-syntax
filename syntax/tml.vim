" Vim syntax file for Template Markup Language
" Language: TML (Template Markup Language)

if exists("b:current_syntax")
  finish
endif

" Include hyphen in keyword characters so hyphenated keywords (else-if,
" delimited-list, etc.) are treated as single words
syn iskeyword @,48-57,_,-

" Escape sequences (highest priority - must come first)
syn match tmlEscape /\\./

" Tag structure - using regions for proper nesting
" Opening tags: {tag_name: parameters}
syn region tmlTag matchgroup=tmlBrace start=/{/ end=/}/ contains=tmlTagName,tmlColon,tmlReference,tmlNamedParam,tmlString,tmlNumber,tmlSymbol oneline

" Close tags: {:tag_name}
syn region tmlCloseTag matchgroup=tmlBrace start=/{:/ end=/}/ contains=tmlCloseTagName oneline

" Tag names (keywords) - conditional
syn keyword tmlConditional contained containedin=tmlTag if if-not else else-if else-if-not

" Tag names (keywords) - repeat/loop
syn keyword tmlRepeat contained containedin=tmlTag each delimited-list delimiter

" Tag names (keywords) - other
syn keyword tmlKeyword contained containedin=tmlTag insert render no-leading-space

" Tag names (keywords) - document structure and formatting
syn keyword tmlStructure contained containedin=tmlTag
	\ bold italic underline
	\ p heading-1 heading-2 heading-3 heading-4
	\ signature date-signature signature-block signature-block-signature
	\ signature-page-preamble signature-page-footer prescribed-legend
	\ line-break column-break page-break section-break tab
	\ white-space non-breaking-hyphen non-breaking-space footer
	\ level-1 level-2 level-3

" Close tag names - conditionals (matches opening tag highlighting)
syn keyword tmlCloseConditional contained containedin=tmlCloseTag if if-not else else-if else-if-not

" Close tag names - repeat/loop (matches opening tag highlighting)
syn keyword tmlCloseRepeat contained containedin=tmlCloseTag each delimited-list delimiter

" Close tag names - other keywords (matches opening tag highlighting)
syn keyword tmlCloseKeyword contained containedin=tmlCloseTag insert render no-leading-space

" Close tag names - document structure and formatting (matches opening tag highlighting)
syn keyword tmlCloseStructure contained containedin=tmlCloseTag
	\ bold italic underline
	\ p heading-1 heading-2 heading-3 heading-4
	\ signature date-signature signature-block signature-block-signature
	\ signature-page-preamble signature-page-footer prescribed-legend
	\ line-break column-break page-break section-break tab
	\ white-space non-breaking-hyphen non-breaking-space footer
	\ level-1 level-2 level-3

" Close tag names - generic pattern for any close tag
syn match tmlCloseTagName /[a-z][a-z0-9-]*/ contained containedin=tmlCloseTag

" Colon separator
syn match tmlColon /:/ contained containedin=tmlTag

" References: variable_name, kebab-case-name, object.attribute, predicate?
syn match tmlReference /[a-z][a-z0-9_-]*\(\.[a-z][a-z0-9_-]*\)*?\?/ contained containedin=tmlTag contains=tmlRefinement

" Named parameters: name=value
syn match tmlNamedParam /[a-z][a-z-]*=/ contained containedin=tmlTag

" String literals
syn region tmlString start=/"/ skip=/\\"/ end=/"/ contained containedin=tmlTag

" Number literals
syn match tmlNumber /\<\d\+\(\.\d\+\)\?\>/ contained containedin=tmlTag

" Symbol values (unquoted identifiers in parameters, after = sign)
syn match tmlSymbol /\(=\)\@<=[a-zA-Z0-9_-]\+/ contained containedin=tmlTag

" Generic tag name - matches right after opening brace using lookbehind
" This ensures tag names are only matched at the start of a tag, not in parameters
syn match tmlTagName /\%({\)\@<=[a-z][a-z0-9-]*/ contained containedin=tmlTag

" Error markers
syn region tmlError matchgroup=tmlErrorDelim start=/{error:}/ end=/{:error}/

" Refinements (methods called on references via dot notation)
" Matches: any predicate method ending in ? (e.g., .plural?, .empty?)
" Also matches known refinements: long_format, no_period, delimited, dollars, etc.
syn match tmlRefinement /\.\([a-z][a-z0-9_]*?\|long_format\|no_period\|delimited\|dollars\|dollars_and_cents\|words_for_single_digits\)/ contained

" Highlight links
hi def link tmlBrace Delimiter
hi def link tmlColon Delimiter
hi def link tmlEscape SpecialChar
hi def link tmlConditional Conditional
hi def link tmlRepeat Repeat
hi def link tmlKeyword Keyword
hi def link tmlCloseConditional Conditional
hi def link tmlCloseRepeat Repeat
hi def link tmlCloseKeyword Keyword
hi def link tmlStructure Type
hi def link tmlCloseStructure Type
hi def link tmlCloseTagName Function
hi def link tmlTagName Function
hi def link tmlReference Identifier
hi def link tmlNamedParam Label
hi def link tmlString String
hi def link tmlNumber Number
hi def link tmlSymbol Constant
hi def link tmlError Error
hi def link tmlErrorDelim Error
hi def link tmlRefinement Function

let b:current_syntax = "tml"
