# NVCHAD CONFIG

##

### Installed LSP/Linters

```bash
css-lsp
css-variables-language-server
emmet-language-server
emmet-ls
eslint-lsp
eslint_d
html-lsp
json-lsp
lua-language-server
markdownlint
prettierd
stylelint
stylelint-lsp
tailwindcss-language-server
typescript-language-server
language-server
yaml-language-server
```

## Shortcuts

- **Wrap selected lines with two different values**:

  ```bash
  S → i → input1:"content" input2:"content2"
  ```

- **Wrap selected lines with html tag**:

  ```bash
  S → t → "htmltag"
  ```

- **Open window with cursor-relevant message:**

  ```bash
  Ctrl + W → d
  ```

- **Go inside line string in edit mode**(useful to go inside html element class):

  ```bash
  f → " → a
  ```

- **Change the tag of html element**:

  ```bash
  c → s → t → input:"tagname"
  ```

## Commands

- **List information on all available LSPs:**

  ```bash
  :help lspconfig-all
  ```

- **Manage Treesitter installations:**

  ```bash
  :TSInstallInfo
  ```
