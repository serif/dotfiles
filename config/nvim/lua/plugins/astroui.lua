return {
  "AstroNvim/astroui",
  ---@type AstroUIOpts
  opts = {
    status = {
      modes = {
        ["n"] = { "(ᴗ_ ᴗ。)", "normal" },
        ["no"] = { "Σ(°△°Σ )", "normal" },
        ["nov"] = { "Σ(°△°Σ )", "normal" },
        ["noV"] = { "Σ(°△°Σ )", "normal" },
        ["no\22"] = { "Σ(°△°Σ )", "normal" },
        ["niI"] = { "(ᴗ_ ᴗ。)", "normal" },
        ["niR"] = { "(ᴗ_ ᴗ。)", "normal" },
        ["niV"] = { "(ᴗ_ ᴗ。)", "normal" },
        ["nt"] = { "(ᴗ_ ᴗ。)", "normal" },
        ["ntT"] = { "(ᴗ_ ᴗ。)", "normal" },
        
        ["v"] = { "(⊙ _ ⊙ )", "visual" },
        ["vs"] = { "(⊙ _ ⊙ )", "visual" },
        ["V"] = { "(⊙ _ ⊙ )", "visual" },
        ["Vs"] = { "(⊙ _ ⊙ )", "visual" },
        ["\22"] = { "(⊙ _ ⊙ )", "visual" },
        ["\22s"] = { "(⊙ _ ⊙ )", "visual" },
        
        ["s"] = { "SUB", "visual" },
        ["S"] = { "SUB", "visual" },
        ["\19"] = { "SUB", "visual" },
        
        ["i"] = { "(•̀ - •́ )", "insert" },
        ["ic"] = { "(•̀ - •́ )", "insert" },
        ["ix"] = { "(•̀ - •́ )", "insert" },
        
        ["R"] = { "( •̯́ ₃ •̯̀)", "replace" },
        ["Rc"] = { "( •̯́ ₃ •̯̀)", "replace" },
        ["Rx"] = { "( •̯́ ₃ •̯̀)", "replace" },
        ["Rv"] = { "( •̯́ ₃ •̯̀)", "replace" },
        ["Rvc"] = { "( •̯́ ₃ •̯̀)", "replace" },
        ["Rvx"] = { "( •̯́ ₃ •̯̀)", "replace" },
        
        ["c"] = { "Σ(°△°Σ )", "command" },
        ["cv"] = { "Σ(°△°Σ )", "command" },
        ["ce"] = { "Σ(°△°Σ )", "command" },
        ["r"] = { "( •̯́ ₃ •̯̀)", "replace" },
        ["rm"] = { "( •̯́ ₃ •̯̀)", "replace" },
        ["r?"] = { "Σ(°△°Σ )", "command" },
        ["!"] = { "Σ(°△° Σ )", "command" },
        ["t"] = { "(⌐■_■)", "terminal" },
      },
      attributes = {
        mode = { bold = true },
      },
      colors = function(hl)
        -- Helper function to convert HSL to RGB hex
        local function hsl_to_hex(h, s, l)
          s = s / 100
          l = l / 100
          
          local function hue_to_rgb(p, q, t)
            if t < 0 then t = t + 1 end
            if t > 1 then t = t - 1 end
            if t < 1/6 then return p + (q - p) * 6 * t end
            if t < 1/2 then return q end
            if t < 2/3 then return p + (q - p) * (2/3 - t) * 6 end
            return p
          end
          
          local q = l < 0.5 and l * (1 + s) or l + s - l * s
          local p = 2 * l - q
          
          local r = hue_to_rgb(p, q, (h / 360) + 1/3)
          local g = hue_to_rgb(p, q, h / 360)
          local b = hue_to_rgb(p, q, (h / 360) - 1/3)
          
          return string.format("#%02x%02x%02x",
            math.floor(r * 255 + 0.5),
            math.floor(g * 255 + 0.5),
            math.floor(b * 255 + 0.5))
        end
        
        local orange = hsl_to_hex(27, 61, 50)
        local teal = hsl_to_hex(150, 40, 50)
        local blue = hsl_to_hex(215, 80, 73) -- 63 + 10
        local magenta = hsl_to_hex(310, 40, 70)
        local salmon = hsl_to_hex(10, 90, 70)
        
        -- The hl parameter contains default colors, just override mode colors
        return vim.tbl_deep_extend("force", hl, {
          normal = orange,
          insert = teal,
          visual = blue,
          replace = magenta,
          command = magenta,
          terminal = salmon,
        })
      end,
    },
  },
}
