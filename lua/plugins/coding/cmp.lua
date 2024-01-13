return {
  -- 补全引擎插件
  "hrsh7th/nvim-cmp",
  event = "VeryLazy",
  dependencies = {
    -- lsp补全
    "hrsh7th/cmp-nvim-lsp",
    -- 路径补全
    "hrsh7th/cmp-path",
    -- command补全
    "hrsh7th/cmp-cmdline",
    -- buffer补全
    "hrsh7th/cmp-buffer",
    -- 表情符号源
    "hrsh7th/cmp-emoji",
    -- 补全操作框架
    "saadparwaiz1/cmp_luasnip",
    -- 补全引擎
    "L3MON4D3/LuaSnip",
    -- 代码片段
    "rafamadriz/friendly-snippets",
  },
  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")
    local kind_icons = require("utils").get_icons("cmp_kinds")
    local cmp_autopairs = require("nvim-autopairs.completion.cmp")

    -- 函数自动添加括号
    cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
    -- 载入vscode片段
    require("luasnip.loaders.from_vscode").lazy_load()
    cmp.setup {
      -- 自动选择第一个
      completion = {
        completeopt = "menu,menuone,noinsert",
      },
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      sources = cmp.config.sources {
        { name = "nvim_lsp", priority = 1000 },
        { name = "luasnip",  priority = 900 },
        { name = "path",     priority = 800 },
        { name = "buffer",   priority = 700 },
        { name = "emoji",    priority = 600 },
      },
      -- 选择框样式
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
      ---@diagnostic disable-next-line: missing-fields
      formatting = {
        fields = { "kind", "abbr", "menu" },
        format = function(entry, vim_item)
          vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
          vim_item.menu = ({
            nvim_lsp = "[LSP]",
            luasnip = "[Snippet]",
            buffer = "[Buffer]",
            path = "[Path]",
            emoji = "[Emoji]",
          })[entry.source.name]
          return vim_item
        end,
      },
      experimental = {
        -- 幽灵文字
        ghost_text = true,
      },
      mapping = require("plugins.coding.cmpkeymaps").getKeys(cmp, luasnip),
      -- 查找模式使用buffer补全
      cmp.setup.cmdline({ "/", "?" }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = "buffer" },
        },
      }),
      -- cmd模式使用补全
      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = "path" },
        }, {
          { name = "cmdline" },
        }),
      })
    }
  end
}
