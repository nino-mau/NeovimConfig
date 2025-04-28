return {
  "nino-mau/poimandres-vue.nvim",   -- **IMPORTANT: Use your actual fork path here**
  lazy = false,                     -- Load theme early before UI loads
  priority = 1000,                  -- Ensure it loads before other UI elements
  -- Optional: Add theme-specific options if the theme supports them
  -- opts = {
  --   -- Example: common options (check theme's README)
  --   -- transparent = true,
  --   -- styles = { comments = "italic" }
  -- },
  -- Optional: Give it a specific name if needed, usually not required if repo name is clear
  name = "poimandres-vue",
}
