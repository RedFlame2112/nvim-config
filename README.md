# Neovim IDE

This build of neovim is intended to give user a nice ide-like experience in their terminals.
Dashboard uses VSCode logo, but this config is not intended to be similar to this garbage.

### Useful features

* Lazy load(1.5x times faster than packer)
* LSP support for go, c, rust, python, json, js, etc
* Terminal, file explorer
* Dashboard
* Rainbow indents
* Git signs
* In file search(ripgrep is needed)
* LeetCode integration for solving leetcode problems
* Snippets engine for automatic code completion
* LLM based support with inbuilt GPT prompt reader (need GPT api + API key environment variable)
* Automatic code generation with Codeium
* VimTeX keybindings, snippets, and full support for writing papers, completing homework assignments, etc.
* Smooth, lossless note taking with Obsidian.nvim 


![Screenshot1](https://github.com/RedFlame2112/nvim-config/blob/master/src/s1.png)
![Screenshot2](https://github.com/daniilty/vsnvim/blob/master/src/s2.png)
![Screenshot3](https://github.com/daniilty/vsnvim/blob/master/src/s3.png)
![Screenshot4](https://github.com/RedFlame2112/nvim-config/blob/master/src/s4.png)
![Screenshot5](https://github.com/RedFlame2112/nvim-config/blob/master/src/s5.png)
![Screenshot6](https://github.com/RedFlame2112/nvim-config/blob/master/src/s6.png)

### Some shortcuts:
  * Ctrl+t - toggle terminal
  * Ctrl+n - toggle file tree
  * Ctrl+f - toggle Telescope 
  * Ctrl+a - toggle live grep search
  * Ctrl+s - toggle search field
  * ZZ - in case you don't know how to exit vim
  * Esc - to exit telescope
  * Ctrl+u - rename function/variable/class/etc... using lsp
  * Ctrl+p - view references
  * Ctrl+i - go to implementation
  * Ctrl+d - go to definition
  * Ctrl+D - go to declaration
  * Ctrl+e - lsp diagnostic
  * K - hover using lsp
