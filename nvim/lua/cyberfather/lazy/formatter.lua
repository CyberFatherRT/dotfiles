return {
    "mhartington/formatter.nvim",
    config = function ()
        local formatter = require("formatter")

        local function prettier()
            return {
                exe = 'prettier',
                args = {
                    '--config-precedence',
                    'prefer-file',
                    '--single-quote',
                    '--no-bracket-spacing',
                    '--prose-wrap',
                    'always',
                    '--arrow-parens',
                    'always',
                    '--trailing-comma',
                    'all',
                    '--no-semi',
                    '--end-of-line',
                    'lf',
                    '--print-width',
                    vim.bo.textwidth,
                    '--stdin-filepath',
                    vim.fn.shellescape(vim.api.nvim_buf_get_name(0)),
                },
                stdin = true,
            }
        end

        local function shfmt()
            return {
                exe = 'shfmt',
                args = { '-' },
                stdin = true,
            }
        end

        formatter.setup {
            logging = false,
            filetype = {
                javascript = { prettier },
                typescript = { prettier },
                javascriptreact = { prettier },
                typescriptreact = { prettier },
                vue = { prettier },
                ['javascript.jsx'] = { prettier },
                ['typescript.tsx'] = { prettier },
                markdown = { prettier },
                css = { prettier },
                json = { prettier },
                jsonc = { prettier },
                scss = { prettier },
                less = { prettier },
                yaml = { prettier },
                graphql = { prettier },
                html = { prettier },
                sh = { shfmt },
                bash = { shfmt },
                rust = {
                    function()
                        return {
                            exe = 'rustfmt',
                            args = { '--emit=stdout' },
                            stdin = true,
                        }
                    end,
                },
                python = {
                    function()
                        return {
                            exe = 'black',
                            args = { '--quiet', '-' },
                            stdin = true,
                        }
                    end,
                },
                go = {
                    function()
                        return {
                            exe = 'gofmt',
                            stdin = true,
                        }
                    end,
                },
            },
        }
    end
}
