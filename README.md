# Noevim Install


> note: 实用技巧 https://xu3352.github.io/linux/2018/10/16/practical-vim-skills

`https://xu3352.github.io/practical_vim`

参考：https://github.com/innovationmech/my-neovim-config/blob/master/lua/plugins/init.lua


```bash
brew install nvim
mv ~/.config/nvim ~/.config/nvim.backup
rm -rf ~/.config/nvim 
rm -rf ~/.local/state/nvim 
rm -rf ~/.local/share/nvim

git clone https://github.com/cmacro/NvChad.git ~/.config/nvim && nvim

or
git clone https://github.com/NvChad/starter ~/.config/nvim && nvim

```

安装默认lsp（lua, http, css）
`MasonInstallAll`

```sh
rm -rf ~/.config/nvim && rm -rf ~/.local/state/nvim && rm -rf ~/.local/share/nvim
```
Obsidian
选项
`lua/options.lua`

```
git clone https://github.com/NvChad/starter ~/.config/nvim && nvim
```

```lua
local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
o.tabstop = 4
o.softtabstop = 4
o.shiftwidth = 4
o.expandtab = true
o.relativenumber = true
o.wrap = false

```

nvim tree 打开git_ignored 过滤文件和文件夹

```sh
{
    "nvim-tree/nvim-tree.lua",
    opts = {
      filters = {
        git_ignored = false,
      },
    },
  },
```

> note: 更多参考 `https://github.com/nvim-tree/nvim-tree.lua/blob/master/doc/nvim-tree-lua.txt` 

快速跳转插件
`/lua/plugins/init.lua`

```lua
 {
        "phaazon/hop.nvim",
        branch = "v2", -- optional but strongly recommended
        opts = {
            multi_windows = true,
            keys = "etovxqpdygfblzhckisuran",
            upercase_labels = true,
        },
        keys = {
            {
                "<leader>fj",
                function()
                    require("hop").hint_words()
                end,
                mode = { "n", "x", "o" },
            },
        },
    }

```

##  riggrep && nerdfont

```sh
brew install reggrep
```

https://www.nerdfonts.com/

## 增加telescope 全文检索快捷键


[NvChad](https://github.com/maguec/NvChad) 默认没有这个快捷键，需要在 `mappings.lua` 增加

[telescope.vim](https://github.com/nvim-telescope/telescope.nvim)

```lua
local builtin = require('telescope.builtin')
map('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
```


##  语言高亮显示设置

https://github.com/nvim-treesitter/nvim-treesitter

加载 `nvim-treesitter` 插件 `plugins/treesitter.lua` 增加配置

```lua
return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local configs = require "nvim-treesitter.configs"

    configs.setup {
      ensure_installed = {
        "lua",
        "javascript",
        "typescript",
        "python",
        "go",
        "rust",
        "sql",
        "make",
        "dockerfile",
        "yaml",
        "toml",
        "graphql",
        "terraform",
        "proto",
        "html",
      },
      sync_install = false,
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },
    }
  end,
}
```


效果图

`:TSInstallInfo` 查看支持语言高亮的安装列表


![[Pasted image 20240828212625.png]]


## go lspconfig

lsp 支持与格式化，需要线安装 lsp，再设置conform。

`lspconfig.lua`

```lua
lspconfig.servers = {
  -- "lua_ls",
  "gopls",
}

... example
... last add

lspconfig.gopls.setup({
  on_attach = function(client, bufnr)
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
    nvlsp.on_attach(client, bufnr)
  end,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  cmd = { "gopls" },
  filetypes = { "go", "gomod", "gotmpl", "gowork" },
  root_dir = lspconfig.util.root_pattern("go.work", "go.mod", ".git"),
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
      completeUnimported = true,
      usePlaceholders = true,
      staticcheck = true,
    },
  },
})
```


格式化设置 `conform.lua`


```lua
local options = {
  formatters_by_ft = {
    ...
    go = { "golines" },
  },
 
  formatters = {
    -- Golang
    golines = {
      prepend_args = { "--max-len=120" },
    },
  },
  
  ....
  format_on_save = {
    .....
  }
}
```

## go debug

go debug
`https://github.com/go-delve/delve`


TSInstall go

```lua
{
	"mfussenegger/nvim-dap",
},
{
	"leoluz/nvim-dap-go",
	ft = "go"
	dependencies = "mfussenegger/nvim-dap",
	config = 
	
},
```

## 插件

| name                                     | note      |     |
| ---------------------------------------- | --------- | --- |
| olexsmir/gopher.nvim                     | 增加Sruct标签 |     |
| https://github.com/catppuccin/catppuccin | 主题        |     |
## Other



> note: 实用技巧 [https://xu3352.github.io/linux/2018/10/16/practical-vim-skills](https://xu3352.github.io/linux/2018/10/16/practical-vim-skills)  
> 参考：[https://github.com/innovationmech/my-neovim-config/blob/master/lua/plugins/init.lua](https://github.com/innovationmech/my-neovim-config/blob/master/lua/plugins/init.lua)  
