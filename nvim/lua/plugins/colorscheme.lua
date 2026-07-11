return {
  { "projekt0n/github-nvim-theme" },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "github_dark_dimmed",
    },
  },
  {
    "projekt0n/github-nvim-theme",
    config = function()
      vim.api.nvim_create_autocmd("ColorScheme", {
        pattern = "github_dark_dimmed",
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
