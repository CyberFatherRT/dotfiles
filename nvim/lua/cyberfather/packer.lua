vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)

    use('wbthomason/packer.nvim')

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.5',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    use({
        'rose-pine/neovim',
        as = "rose-pine",
        config = function()
            vim.cmd('colorscheme rose-pine')
        end
    })

    use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
    use('nvim-treesitter/playground')
    use('theprimeagen/harpoon')
    use('mbbill/undotree')
    use('tpope/vim-fugitive')
    use('NoahTheDuke/vim-just')
    use('laytan/cloak.nvim')

    use({
        "jose-elias-alvarez/null-ls.nvim",
        opts = function()
            return require("after.null-ls")
        end,
        requires = { "nvim-lua/plenary.nvim" },
    })

    use('alec-gibson/nvim-tetris')

    use('IndianBoy42/tree-sitter-just')
    use('tomtom/tcomment_vim')
    use({'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async'})

    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        requires = {
            --- Uncomment these if you want to manage the language servers from neovim
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},

            -- LSP Support
            {'neovim/nvim-lspconfig'},
            -- Autocompletion
            {'hrsh7th/nvim-cmp'},
            {'hrsh7th/cmp-nvim-lsp'},
            {'L3MON4D3/LuaSnip'},
        }
    }

end)
