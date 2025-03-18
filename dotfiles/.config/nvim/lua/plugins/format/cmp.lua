local M = {}

M.plugin = {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-nvim-lua",
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    "rafamadriz/friendly-snippets",
  },
  config = function()
    M.config()
  end,
}

local check_bckspace = function()
  local col = vim.fn.col "." - 1
  return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
end

M.config = function()
  local ok = require("utils.check-requires").check({
    "cmp",
    "luasnip",
  })

  if not ok then
    return
  end

  local cmp = require("cmp")
  local luasnip = require("luasnip")

  local kind_icons = require("utils.icons").cmp_kind

  local sources = {
    { name = "nvim_lsp" },
    { name = "nvim_lua" },
    { name = "luasnip" },
    { name = "buffer" },
    { name = "path" },
  }

  local snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  }

  local completion = {
    completeopt = "menu,menuone,preview,noselect",
  }

  local window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  }

  local formatting = {
    -- changing the order of fields so the icon is the first
    fields = { "menu", "abbr", "kind" },

    -- here is where the change happens
    format = function(entry, vim_item)
      -- Kind icons
      vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
      -- vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
      vim_item.menu = ({
        nvim_lsp = "[LSP]",
        nvim_lua = "[NVIM_LUA]",
        luasnip = "[Snippet]",
        buffer = "[Buffer]",
        path = "[Path]",
      })[entry.source.name]
      return vim_item
    end,
  }

  local mapping = cmp.mapping.preset.insert({
    ["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
    ["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
    ["<C-e>"] = cmp.mapping.abort(),        -- close completion window
    ["<C-y>"] = cmp.config.disable,         -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expandable() then
        luasnip.expand()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif check_bckspace() then
        fallback()
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
  })

  local experimental = {
    ghosts_text = false,
    native_menu = false,
  }
  local confirm_opts = {
    behavior = cmp.ConfirmBehavior.Replace,
    select = false,
  }

  local opts = {
    preselect = "item",
    completion = completion,
    sources = sources,
    confirm_opts = confirm_opts,
    snippet = snippet,
    mapping = mapping,
    window = window,
    formatting = formatting,
    experimental = experimental,
  }
  require("luasnip.loaders.from_vscode").lazy_load()
  cmp.setup(opts)
end

if not pcall(debug.getlocal, 4, 1) then
  M.config()
end

return M
