# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a Neovim plugin that provides syntax highlighting for Template Markup Language (TML). It is a pure Vim/Lua plugin with no external dependencies or build steps.

## Development

**Testing changes**: Open Neovim and load a TML file matching the configured patterns (default: `**/templates/**/*.txt`). Run `:checkhealth template-markup-syntax` to verify installation.

**Reloading during development**: After modifying files, restart Neovim or manually source changed files with `:luafile %` for Lua files or `:source %` for Vim files.

## Architecture

The plugin follows standard Neovim plugin structure:

- **Entry point**: `plugin/template-markup-syntax.lua` - Loads once, sets up default filetype detection
- **Configuration**: `lua/template-markup-syntax/init.lua` - Exposes `setup(opts)` for user configuration
- **Filetype detection**: `lua/template-markup-syntax/ftdetect.lua` - Converts glob patterns to Lua patterns and registers with `vim.filetype.add()`
- **Syntax highlighting**: `syntax/tml.vim` - Vim syntax definitions for TML constructs
- **Filetype settings**: `ftplugin/tml.vim` - Buffer-local settings for TML files
- **Health check**: `lua/template-markup-syntax/health.lua` - Diagnostic checks via `:checkhealth`

## TML Syntax Constructs

When modifying `syntax/tml.vim`, these are the key TML patterns:

| Pattern | Example |
|---------|---------|
| Opening tags | `{keyword: params}` |
| Closing tags | `{:keyword}` |
| References | `object.attribute.nested?` |
| Named params | `as=item` |
| Refinements | `.long_format`, `.plural?`, `.dollars` |
| Escapes | `\{`, `\}` |

Keywords are categorized as: conditionals (`if`, `else`, `else-if`), loops (`each`, `delimited-list`), and general (`insert`, `render`).
