return {
  { "EdenEast/nightfox.nvim" },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "carbonfox",
    },
  },
  {
    "EdenEast/nightfox.nvim",
    config = function()
      vim.api.nvim_create_autocmd("ColorScheme", {
        pattern = "carbonfox",
        callback = function()
          local bg = "#102010"
          local fg = "#33ff33"
          local selection_bg = "#336633"
          local selection_fg = "#f2fff2"

          vim.api.nvim_set_hl(0, "Normal", { bg = bg, fg = fg })
          vim.api.nvim_set_hl(0, "NormalNC", { bg = bg, fg = fg })
          vim.api.nvim_set_hl(0, "NormalFloat", { bg = bg, fg = fg })
          vim.api.nvim_set_hl(0, "SignColumn", { bg = bg })
          vim.api.nvim_set_hl(0, "Cursor", { bg = fg, fg = bg })
          vim.api.nvim_set_hl(0, "Visual", { bg = selection_bg, fg = selection_fg })
          vim.api.nvim_set_hl(0, "CursorLine", { bg = "#1a301a" })
          vim.api.nvim_set_hl(0, "CursorLineNr", { fg = fg, bg = "#1a301a", bold = true })
          vim.api.nvim_set_hl(0, "LineNr", { fg = "#4c594c", bg = bg })

          -- which-key popup
          vim.api.nvim_set_hl(0, "WhichKey", { fg = fg, bold = true })
          vim.api.nvim_set_hl(0, "WhichKeyGroup", { fg = selection_fg })
          vim.api.nvim_set_hl(0, "WhichKeyDesc", { fg = fg })
          vim.api.nvim_set_hl(0, "WhichKeySeparator", { fg = "#4c594c" })
          vim.api.nvim_set_hl(0, "WhichKeyFloat", { bg = bg })
          vim.api.nvim_set_hl(0, "WhichKeyBorder", { fg = fg, bg = bg })
          vim.api.nvim_set_hl(0, "WhichKeyValue", { fg = "#4c594c" })

          -- :Lazy plugin manager UI
          vim.api.nvim_set_hl(0, "LazyNormal", { bg = bg, fg = fg })
          vim.api.nvim_set_hl(0, "LazyH1", { bg = selection_bg, fg = selection_fg, bold = true })
          vim.api.nvim_set_hl(0, "LazyH2", { fg = fg, bold = true })
          vim.api.nvim_set_hl(0, "LazyButton", { bg = "#1a301a", fg = fg })
          vim.api.nvim_set_hl(0, "LazyButtonActive", { bg = selection_bg, fg = selection_fg })
          vim.api.nvim_set_hl(0, "LazyComment", { fg = "#4c594c" })
          vim.api.nvim_set_hl(0, "LazySpecial", { fg = fg })

          -- Snacks dashboard
          vim.api.nvim_set_hl(0, "SnacksDashboardHeader", { fg = fg, bold = true })
          vim.api.nvim_set_hl(0, "SnacksDashboardDesc", { fg = fg })
          vim.api.nvim_set_hl(0, "SnacksDashboardKey", { fg = selection_fg, bold = true })
          vim.api.nvim_set_hl(0, "SnacksDashboardIcon", { fg = fg })
          vim.api.nvim_set_hl(0, "SnacksDashboardFooter", { fg = "#4c594c" })
          vim.api.nvim_set_hl(0, "SnacksDashboardSpecial", { fg = fg })
          vim.api.nvim_set_hl(0, "SnacksDashboardDir", { fg = "#4c594c" })
          vim.api.nvim_set_hl(0, "SnacksDashboardFile", { fg = fg })
          vim.api.nvim_set_hl(0, "SnacksNormal", { bg = bg, fg = fg })
          vim.api.nvim_set_hl(0, "SnacksTitle", { fg = fg, bg = bg, bold = true })
          vim.api.nvim_set_hl(0, "FloatTitle", { fg = fg, bg = bg, bold = true })

          -- Snacks indent guides
          vim.api.nvim_set_hl(0, "SnacksIndent", { fg = "#4c594c" })
          vim.api.nvim_set_hl(0, "SnacksIndentScope", { fg = "#5fb35f" })
          vim.api.nvim_set_hl(0, "SnacksIndentChunk", { fg = "#5fb35f" })

          -- Completion popup (blink.cmp inherits these via Pmenu/PmenuSel)
          vim.api.nvim_set_hl(0, "Pmenu", { bg = "#1a301a", fg = fg })
          vim.api.nvim_set_hl(0, "PmenuSel", { bg = selection_bg, fg = selection_fg })
          vim.api.nvim_set_hl(0, "PmenuSbar", { bg = "#1a301a" })
          vim.api.nvim_set_hl(0, "PmenuThumb", { bg = "#5fb35f" })

          -- Titles (explorer/picker headers) — gruvbox-material links these
          -- to an orange "Title" group by default.
          vim.api.nvim_set_hl(0, "Title", { fg = fg, bold = true })
          vim.api.nvim_set_hl(0, "SnacksPickerTitle", { fg = fg, bold = true })
          vim.api.nvim_set_hl(0, "SnacksPickerPreviewTitle", { fg = fg, bold = true })
        end,
      })
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      options = {
        theme = {
          normal = {
            a = { bg = "#33ff33", fg = "#102010", gui = "bold" },
            b = { bg = "#336633", fg = "#f2fff2" },
            c = { bg = "#102010", fg = "#33ff33" },
          },
          insert = { a = { bg = "#f2fff2", fg = "#102010", gui = "bold" } },
          visual = { a = { bg = "#336633", fg = "#f2fff2", gui = "bold" } },
          replace = { a = { bg = "#4c594c", fg = "#f2fff2", gui = "bold" } },
          inactive = {
            a = { bg = "#102010", fg = "#4c594c" },
            b = { bg = "#102010", fg = "#4c594c" },
            c = { bg = "#102010", fg = "#4c594c" },
          },
        },
      },
    },
  },
}
