local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

-- All

ls.add_snippets("all", {
  -- Functions Block
  s("cFunc", {
    t("// === Functions ==="),
  }),

  -- State Block
  s("cState", {
    t("// === State ==="),
  }),

  -- Setup Block
  s("cSetup", {
    t("// === Setup ==="),
  }),

  -- Comment title
  s("cTitle", {
    t("// === "), i(1), t(" ==="),
  }),

  -- HTML comment
  s("cHtm", {
    t("<!-- "), i(1), t(" -->"),
  }),

  -- Comment section
  s("cSec", {
    t({ "/**", "* " }), i(1), t({ "", "*/" }),
  }),
})

-- Javascript/Typescript

ls.add_snippets("javascript", {
  -- Console.log
  s("clg", {
    t("console.log("), i(1), t(");"),
  }),

  -- Console.error
  s("cle", {
    t("console.error('"), i(1), t(": ');"),
  }),

  -- Console.debug
  s("cld", {
    t("console.debug("), i(1), t(");"),
  }),
})

ls.add_snippets("typescript", {
  -- Console.log
  s("clg", {
    t("console.log("), i(1), t(");"),
  }),

  -- Console.error
  s("cle", {
    t("console.error('"), i(1), t(": ');"),
  }),

  -- Console.debug
  s("cld", {
    t("console.debug("), i(1), t(");"),
  }),
})

-- Vue

ls.add_snippets("vue", {
  -- Console.log
  s("clg", {
    t("console.log("), i(1), t(");"),
  }),

  -- Console.error
  s("cle", {
    t("console.error('"), i(1), t(": ');"),
  }),

  -- Console.debug
  s("cld", {
    t("console.debug("), i(1), t(");"),
  }),
})
