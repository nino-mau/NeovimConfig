local ls = require("luasnip")
local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep
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

  -- Jsdoc comment line
  s("cDoc", {
    t({ "/**" }), i(1), t({ "*/" }),
  }),

  -- starting boilerplate
  s("v3setup", fmt([[
  <template>
    <div class="{}">
      {}
    </div>
  </template>

  <script setup lang="ts">
  </script>

  <style scoped>
  </style>
]], {
    i(1, "className"), -- Placeholder for className
    i(2, "content"),   -- Placeholder for content inside the div
  }))
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


  -- vue computed (composition API)
  s("cld", {
    t("console.debug("), i(1), t(");"),
  }),
  s("v3computed", fmt([[
    const {} = computed(() => {{
      {}
    }});
    ]], {
    i(1, "computedValue"),
    i(2, "// logic here")
  })),

  -- define props  (composition API)
  s("v3defineprops", {
    t("defineProps({"),
    t("\n  "),
    i(1, "propC"),        -- Placeholder for the prop name
    t(": { type: "),
    i(2, "String"),       -- Placeholder for the prop type (e.g., String, Number, etc.)
    t(", default: "),
    i(3, "defaultValue"), -- Placeholder for the default value
    t(" },"),
    t("\n})"),
  }),

  -- vue watcher (composition API)
  s("v3watch", {
    t("watch("),
    i(1, "source"),
    t({ ",", "\t(" }),
    i(2, "newValue"),
    t(", "),
    i(3, "oldValue"),
    t({ ") => {", "\t" }),
    i(4, "// logic here"),
    t({ "", "})" }),
  }),

  -- vue onmounted (composition API)
  s("v3Onmounted", {
    t("onMounted(() => {"),
    i(1, "// Your code here"),
    t({ "", "});" }),
  }),

  -- vue class binding
  s("v3condclass", {
    t(':class="['),
    t({ "", "\t" }), t("condition1 ? '"), i(1, "class-if-true"), t("' : '"), i(2, "class-if-false"), t("',"),
    t({ "", "]\"" }),
    i(0)
  })
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


  s({ trig = "a", name = "await", dscr = "await value" },
    { t("await "), i(1, "value") }
  ),

  s({ trig = "v", name = "var statement", dscr = "var name" },
    { t("var "), i(1, "name"), t(";") }
  ),

  s({ trig = "va", name = "var assignment", dscr = "var name = value" },
    { t("var "), i(1, "name"), t(" = "), i(2, "value"), t(";") }
  ),

  s({ trig = "l", name = "let statement", dscr = "let name" },
    { t("let "), i(1, "name"), t(";") }
  ),

  s({ trig = "la", name = "let assignment", dscr = "let name = value" },
    { t("let "), i(1, "name"), t(" = "), i(2, "value"), t(";") }
  ),


  s({ trig = "c", name = "const statement", dscr = "const name" },
    { t("const "), i(1, "name"), t(";") }
  ),

  s({ trig = "ca", name = "const assignment", dscr = "const name = value" },
    { t("const "), i(1, "name"), t(" = "), i(2, "value"), t(";") }
  ),

  s({ trig = "cd", name = "const statement from destructuring", dscr = "const { prop } = value" },
    { t("const { "), i(2, "prop"), t(" } = "), i(1, "object"), t(";") }
  ),

  s({ trig = "cad", name = "const statement from array destructuring", dscr = "const [ prop ] = value" },
    { t("const [ "), i(2, "prop"), t(" ] = "), i(1, "array"), t(";") }
  ),

  s({ trig = "caa", name = "const assignment awaited", dscr = "const name = await value" }, -- Renamed from 'ca' to avoid conflict
    { t("const "), i(1, "name"), t(" = await "), i(2, "promise"), t(";") }
  ),

  s({ trig = "cda", name = "const destructuring assignment awaited", dscr = "const { name } = await value" },
    { t("const { "), i(1, "prop"), t(" } = await "), i(2, "promise"), t(";") }
  ),

  -- Note: Cleaned up significantly
  s({ trig = "cf", name = "const arrow function assignment", dscr = "const name = (...) => { ... }" },
    fmt(
      [[
      const {} = ({}) => {{
      	return {};
      }}
      ]],
      { i(1, "functionName"), i(2, "args"), i(0) }
    )
  ),

  s({ trig = "laa", name = "let assignment awaited", dscr = "let name = await value" }, -- Renamed from 'la' to avoid conflict
    { t("let "), i(1, "name"), t(" = await "), i(2, "promise"), t(";") }
  ),

  s({ trig = "cy", name = "const assignment yielded", dscr = "const name = yield value" },
    { t("const "), i(1, "name"), t(" = yield "), i(2, "value"), t(";") }
  ),

  s({ trig = "ly", name = "let assignment yielded", dscr = "let name = yield value" },
    { t("let "), i(1, "name"), t(" = yield "), i(2, "value"), t(";") }
  ),

  s({ trig = "co", name = "const object", dscr = "const name = { ... }" },
    fmt(
      [[
      const {} = {{
      	{}
      }};
      ]],
      { i(1, "objectName"), i(0) }
    )
  ),

  s({ trig = "car", name = "const array", dscr = "const name = [ ... ]" },
    fmt(
      [[
      const {} = [
      	{}
      ];
      ]],
      { i(1, "arrayName"), i(0) }
    )
  ),

  s({ trig = "cs", name = "class", dscr = "class Name { constructor(...) }" },
    fmt(
      [[
      class {} {{
      	constructor({}) {{
      		{}
      	}}
      }}
      ]],
      { i(1, "ClassName"), i(2, "args"), i(0) }
    )
  ),

  s({ trig = "csx", name = "class extends", dscr = "class Name extends SuperClass { ... }" },
    fmt(
      [[
      class {} extends {} {{
      	constructor({}) {{
      		super({});
      		{}
      	}}
      }}
      ]],
      { i(1, "ClassName"), i(2, "SuperClass"), i(3, "args"), rep(3), i(0) }
    )
  ),

  s({ trig = "e", name = "module export", dscr = "export member" },
    { t("export "), i(1, "member"), t(";") }
  ),

  s({ trig = "ie", name = "export interface", dscr = "export interface" },
    fmt(
      [[
      export interface {} {{
      	{}:;
      }}
      ]],
      { i(1, "interfacename"), i(0) }
    )
  ),

  s({ trig = "ec", name = "module export const", dscr = "export const member = value" },
    { t("export const "), i(1, "member"), t(" = "), i(2, "value"), t(";") }
  ),

  -- Note: Cleaned up significantly
  s({ trig = "ef", name = "export named function", dscr = "export function member(...) { ... }" },
    fmt(
      [[
      export function {}({}) {{
      	{}
      }}
      ]],
      { i(1, "functionname"), i(2, "args"), i(0) }
    )
  ),

  s({ trig = "eaf", name = "export async named function", dscr = "export async function member(...) { ... }" },
    fmt(
      [[
      export async function {}({}) {{
      	{}
      }}
      ]],
      { i(1, "functionName"), i(2, "args"), i(0) }
    )
  ),

  s({ trig = "ed", name = "module default export", dscr = "export default member" },
    { t("export default "), i(1, "member"), t(";") }
  ),

  -- Note: Cleaned up significantly
  s({ trig = "edf", name = "module default export function", dscr = "export default function name(...) { ... }" },
    fmt(
      [[
      export default function {}({}) {{
      	{}
      }}
      ]],
      { i(1, "functionName"), i(2, "args"), i(0) }
    )
  ),

  -- Note: Cleaned up significantly
  s({ trig = "to", name = "typeof", dscr = "typeof source === 'type'" },
    fmt([[typeof {} === '{}']], { i(1, "source"), i(2, "undefined") })
  ),

  s({ trig = "t", name = "this", dscr = "this." },
    { t("this.") }
  ),

  s({ trig = "iof", name = "instanceof", dscr = "source instanceof Object" },
    fmt([[{} instanceof {}]], { i(1, "source"), i(2, "Type") })
  ),

  s({ trig = "if", name = "if statement", dscr = "if (condition) { ... }" }, -- Renamed from original 'if' prefix
    fmt(
      [[
            if ({}) {{
            	{}
            }}
            ]],
      { i(1, "condition"), i(0) }
    )
  ),

  s({ trig = "lif", name = "let and if statement", dscr = "let name = value; if (condition) { ... }" }, -- Note: Original JSON structure was unusual. Assuming standard 'if'.
    fmt(
      [[
      if ({}) {{
      	{}
      }}
      ]],
      { i(1, "condition"), i(0) }
    )
  ),

  s({ trig = "ei", name = "else if statement", dscr = "else if (condition) { ... }" },
    fmt(
      [[
      else if ({}) {{
      	{}
      }}
      ]],
      { i(1, "condition"), i(0) }
    )
  ),

  s({ trig = "el", name = "else statement", dscr = "else { ... }" }, -- Renamed from original 'else' prefix
    fmt(
      [[
            else {{
            	{}
            }}
            ]],
      { i(0) }
    )
  ),

  s({ trig = "ife", name = "if/else statement", dscr = "if (condition) { ... } else { ... }" },
    fmt(
      [[
            if ({}) {{
            	{}
            }} else {{
                {}
            }}
            ]],
      { i(1, "condition"), i(2), i(0) }
    )
  ),

  s({ trig = "tn", name = "throw new Error", dscr = "throw new Error(...)" },
    fmt([[throw new Error({});]], { i(1, "'message'") })
  ),

  s({ trig = "try", name = "try/catch", dscr = "try { ... } catch (err) { ... }" }, -- Renamed from 'tc'
    fmt(
      [[
      try {{
      	{}
      }} catch ({}) {{
      	{}
      }}
      ]],
      { i(1), i(2, "err"), i(0) }
    )
  ),

  s({ trig = "tf", name = "try/finally", dscr = "try { ... } finally { ... }" },
    fmt(
      [[
      try {{
      	{}
      }} finally {{
      	{}
      }}
      ]],
      { i(1), i(0) }
    )
  ),

  s({ trig = "tcf", name = "try/catch/finally", dscr = "try { ... } catch (err) { ... } finally { ... }" },
    fmt(
      [[
      try {{
      	{}
      }} catch ({}) {{
      	{}
      }} finally {{
          {}
      }}
      ]],
      { i(1), i(2, "err"), i(3), i(0) }
    )
  ),

  s({ trig = "fan", name = "anonymous function", dscr = "function(...) { ... }" },
    fmt(
      [[
      function({}) {{
      	{}
      }}
      ]],
      { i(1, "args"), i(0) }
    )
  ),

  -- Note: Cleaned up significantly
  s({ trig = "fn", name = "named function", dscr = "function name(...) { ... }" },
    fmt(
      [[
      function {}({}) {{
      	{}
      }}
      ]],
      { i(1, "functionName"), i(2, "args"), i(0) }
    )
  ),

  s({ trig = "afn", name = "async named function", dscr = "async function name(...) { ... }" }, -- Added async version
    fmt(
      [[
            async function {}({}) {{
                {}
            }}
            ]],
      { i(1, "functionName"), i(2, "args"), i(0) }
    )
  ),

  s({ trig = "aiife", name = "async immediately-invoked function expression", dscr = ";(async (...) => { ... })()" },
    fmt(
      [[
      ;(async ({}) => {{
      	{}
      }})({})
      ]],
      { i(1, "args"), i(0), i(2) }
    )
  ),

  s({ trig = "fa", name = "arrow function", dscr = "(...) => { ... }" }, -- Renamed from original 'f' prefix
    fmt(
      [[
      ({}) => {{
      	{}
      }}
      ]],
      { i(1, "args"), i(0) }
    )
  ),

  s({ trig = "fna", name = "named arrow function", dscr = "const name = (...) => { ... }" }, -- Combined with cf
    fmt(
      [[
            const {} = ({}) => {{
                {}
            }}
            ]],
      { i(1, "functionName"), i(2, "args"), i(0) }
    )
  ),


  s({ trig = "f1", name = "single-line arrow function", dscr = "(...) => statement" },
    fmt([[({}) => {}]], { i(1, "args"), i(2, "statement") })
  ),

  s({ trig = "afa", name = "async arrow function", dscr = "async (...) => { ... }" }, -- Renamed from 'af'
    fmt(
      [[
      async ({}) => {{
      	{}
      }}
      ]],
      { i(1, "args"), i(0) }
    )
  ),

  s({ trig = "gfn", name = "named generator", dscr = "function* name(...) { ... }" },
    fmt(
      [[
      function* {}({}) {{
      	yield {};
      	{}
      }}
      ]],
      { i(1, "generatorName"), i(2, "args"), i(3, "value"), i(0) }
    )
  ),

  s({ trig = "gfa", name = "anonymous generator", dscr = "function* (...) { ... }" },
    fmt(
      [[
      function* ({}) {{
      	yield {};
      	{}
      }}
      ]],
      { i(1, "args"), i(2, "value"), i(0) }
    )
  ),

  s({ trig = "cl", name = "console.log", dscr = "console.log(...)" }, -- Renamed from 'clg'
    fmt([[console.log({})]], { i(0) })
  ),

  s({ trig = "log", name = "console.log with label", dscr = "console.log('label:', variable)" },
    fmt([[console.log('{}', {})]], { i(1, "label"), i(2, "variable") })
  ),

  s({ trig = "cw", name = "console.warn", dscr = "console.warn(...)" },
    fmt([[console.warn({})]], { i(0) })
  ),

  s({ trig = "ce", name = "console.error", dscr = "console.error(...)" }, -- Renamed from 'cerr'
    fmt([[console.error({})]], { i(0) })
  ),

  s({ trig = "js", name = "JSON.stringify()", dscr = "JSON.stringify(...)" },
    fmt([[JSON.stringify({})]], { i(1, "object") })
  ),

  s({ trig = "jp", name = "JSON.parse()", dscr = "JSON.parse(...)" },
    fmt([[JSON.parse({})]], { i(1, "string") })
  ),

  -- Note: Cleaned up significantly
  s({ trig = "m", name = "method", dscr = "method(...) { ... }" },
    fmt(
      [[
      {}({}) {{
      	{}
      }}
      ]],
      { i(1, "methodName"), i(2, "args"), i(0) }
    )
  ),

  s({ trig = "oa", name = "Object.assign", dscr = "Object.assign(dest, src)" },
    fmt([[Object.assign({}, {})]], { i(1, "target"), i(2, "source") })
  ),

  s({ trig = "oc", name = "Object.create", dscr = "Object.create(proto)" }, -- Added
    fmt([[Object.create({})]], { i(1, "prototype") })
  ),

  s({ trig = "od", name = "Object.defineProperty", dscr = "Object.defineProperty(obj, prop, descriptor)" }, -- Added
    fmt([[Object.defineProperty({}, '{}', {{ {} }})]], { i(1, "obj"), i(2, "prop"), i(0) })
  ),

  -- Note: Cleaned up significantly
  s({ trig = "og", name = "Object.getOwnPropertyDescriptor", dscr = "Object.getOwnPropertyDescriptor(obj, 'prop')" },
    fmt([[Object.getOwnPropertyDescriptor({}, '{}')]], { i(1, "obj"), i(2, "prop") })
  ),

  s({ trig = "te", name = "ternary", dscr = "cond ? true : false" },
    fmt([[{} ? {} : {}]], { i(1, "condition"), i(2, "exprIfTrue"), i(3, "exprIfFalse") })
  ),

  s({ trig = "ta", name = "ternary assignment", dscr = "const x = cond ? true : false" },
    fmt([[const {} = {} ? {} : {};]], { i(1, "variable"), i(2, "condition"), i(3, "exprIfTrue"), i(4, "exprIfFalse") })
  ),

  s({ trig = "ok", name = "Object.keys", dscr = "Object.keys(obj)" },
    fmt([[Object.keys({})]], { i(1, "obj") })
  ),

  s({ trig = "ov", name = "Object.values", dscr = "Object.values(obj)" }, -- Added
    fmt([[Object.values({})]], { i(1, "obj") })
  ),

  s({ trig = "oe", name = "Object.entries", dscr = "Object.entries(obj)" },
    fmt([[Object.entries({})]], { i(1, "obj") })
  ),

  s({ trig = "of", name = "Object.fromEntries", dscr = "Object.fromEntries(iterable)" }, -- Added
    fmt([[Object.fromEntries({})]], { i(1, "iterable") })
  ),


  s({ trig = "r", name = "return", dscr = "return value" },
    { t("return "), i(0), t(";") }
  ),

  s({ trig = "y", name = "yield", dscr = "yield value" },
    { t("yield "), i(0), t(";") }
  ),

  s({ trig = "rt", name = "return this", dscr = "return this" },
    { t("return this;") }
  ),

  s({ trig = "rn", name = "return null", dscr = "return null" }, -- Added
    { t("return null;") }
  ),

  s({ trig = "rf", name = "return false", dscr = "return false" }, -- Added
    { t("return false;") }
  ),

  s({ trig = "rt", name = "return true", dscr = "return true" }, -- Added
    { t("return true;") }
  ),

  s({ trig = "ro", name = "return new object", dscr = "return { ... }" }, -- Renamed from 'ro'
    fmt(
      [[
      return {{
      	{}
      }};
      ]],
      { i(0) }
    )
  ),

  s({ trig = "ra", name = "return new array", dscr = "return [ ... ]" },
    fmt(
      [[
      return [
      	{}
      ];
      ]],
      { i(0) }
    )
  ),


  s({ trig = "for", name = "For Loop", dscr = "Standard C-style for loop" },
    {
      t("for (let "), i(1, "i"), t(" = 0; "), rep(1), t(" < "), i(2, "array"), t(".length; "), rep(1), t("++) {"),
      t("\n\tconst "), i(3, "element"), t(" = "), rep(2), t("["), rep(1), t("];"),
      t("\n\t"), i(0),
      t("\n}")
    }
  ),

  s({ trig = "foreach", name = "For-Each Loop", dscr = "array.forEach loop" }, -- Original JSON had wrong prefix/body for this name
    {
      i(1, "array"), t(".forEach("), i(2, "element"), t(" => {"),
      t("\n\t"), i(0),
      t("\n});")
    }
  ),

  s({ trig = "forin", name = "For-In Loop", dscr = "for...in loop for object keys" },
    {
      t("for (const "), i(1, "key"), t(" in "), i(2, "object"), t(") {"),
      t("\n\tif (Object.hasOwnProperty.call("), rep(2), t(", "), rep(1), t(")) {"), -- Added hasOwnProperty check
      t("\n\t\tconst "), i(3, "element"), t(" = "), rep(2), t("["), rep(1), t("];"),
      t("\n\t\t"), i(0),
      t("\n\t}"),
      t("\n}")
    }
  ),

  s({ trig = "forof", name = "For-Of Loop", dscr = "for...of loop for iterables" },
    {
      t("for (const "), i(1, "item"), t(" of "), i(2, "iterable"), t(") {"),
      t("\n\t"), i(0),
      t("\n}")
    }
  ),

  s({ trig = "forawaitof", name = "For-Await-Of Loop", dscr = "for await...of loop for async iterables" },
    {
      t("for await (const "), i(1, "item"), t(" of "), i(2, "asyncIterable"), t(") {"),
      t("\n\t"), i(0),
      t("\n}")
    }
  ),

  s({ trig = "switch", name = "Switch Statement", dscr = "Switch statement" },
    {
      t("switch ("), i(1, "expression"), t(") {"),
      t("\n\tcase "), i(2, "value"), t(":"),
      t("\n\t\t"), i(0),
      t("\n\t\tbreak;"),
      t("\n"),
      t("\n\tdefault:"),
      t("\n\t\tbreak;"),
      t("\n}")
    }
  ),

  s({ trig = "while", name = "While Statement", dscr = "While loop" },
    {
      t("while ("), i(1, "condition"), t(") {"),
      t("\n\t"), i(0),
      t("\n}")
    }
  ),

  s({ trig = "dowhile", name = "Do-While Statement", dscr = "Do-while loop" },
    {
      t("do {"),
      t("\n\t"), i(0),
      t("\n} while ("), i(1, "condition"), t(");")
    }
  ),

  s({ trig = "settimeout", name = "Set Timeout Function", dscr = "setTimeout function" },
    {
      t("setTimeout(() => {"),
      t("\n\t"), i(0),
      t("\n}, "), i(1, "delay"), t(");")
    }
  ),

  s({ trig = "setinterval", name = "Set Interval Function", dscr = "setInterval function" },
    {
      t("setInterval(() => {"),
      t("\n\t"), i(0),
      t("\n}, "), i(1, "interval"), t(");")
    }
  ),

  s({ trig = "#region", name = "Region Start", dscr = "Start foldable region" },
    { t("//#region "), i(1, "Region Name"), t("\n"), i(0) }
  ),

  s({ trig = "#endregion", name = "Region End", dscr = "End foldable region" },
    { t("//#endregion"), i(0) }
  ),

  -- Number methods
  s({ trig = "isFinite", name = "Number isFinite", dscr = "Number.isFinite()" },
    { t("Number.isFinite("), i(1, "value"), t(")") }
  ),
  s({ trig = "isInteger", name = "Number isInteger", dscr = "Number.isInteger()" },
    { t("Number.isInteger("), i(1, "value"), t(")") }), -- Added
  s({ trig = "isNaN", name = "Number isNaN", dscr = "Number.isNaN()" },
    { t("Number.isNaN("), i(1, "value"), t(")") }
  ),
  s({ trig = "isSafeInteger", name = "Number isSafeInteger", dscr = "Number.isSafeInteger()" },
    { t("Number.isSafeInteger("), i(1, "value"), t(")") }), -- Added
  s({ trig = "parseFloat", name = "Number parseFloat", dscr = "Number.parseFloat()" },
    { t("Number.parseFloat("), i(1, "string"), t(")") }
  ),
  s({ trig = "parseInt", name = "Number parseInt", dscr = "Number.parseInt()" },
    { t("Number.parseInt("), i(1, "string"), t(", "), i(2, "radix"), t(")") }
  ),
  s({ trig = "toFixed", name = "Number toFixed", dscr = "Number.prototype.toFixed()" },
    { t("toFixed("), i(1, "digits"), t(")") }
  ),
  s({ trig = "toExponential", name = "Number toExponential", dscr = "Number.prototype.toExponential()" },
    { t("toExponential("), i(1, "fractionDigits"), t(")") }), -- Added
  s({ trig = "toPrecision", name = "Number toPrecision", dscr = "Number.prototype.toPrecision()" },
    { t("toPrecision("), i(1, "precision"), t(")") }),        -- Added
  s({ trig = "toLocaleString", name = "Number toLocaleString", dscr = "Number.prototype.toLocaleString()" },
    { t("toLocaleString("), i(1, "locales"), i(2, ", options"), t(")") }
  ),

  -- Array methods (simplified some bodies)
  s({ trig = "push", name = "Array push", dscr = "Array.prototype.push()" },
    { t("push("), i(1, "element1"), i(0), t(")") }
  ),
  s({ trig = "pop", name = "Array pop", dscr = "Array.prototype.pop()" }, { t("pop()") }),         -- Added
  s({ trig = "shift", name = "Array shift", dscr = "Array.prototype.shift()" }, { t("shift()") }), -- Added
  s({ trig = "unshift", name = "Array unshift", dscr = "Array.prototype.unshift()" },
    { t("unshift("), i(1, "element1"), i(0), t(")") }),                                            -- Added
  s({ trig = "reverse", name = "Array reverse", dscr = "Array.prototype.reverse()" },
    { t("reverse()") }
  ),
  s({ trig = "sort", name = "Array sort", dscr = "Array.prototype.sort()" },
    { t("sort("), i(1, "compareFunction"), t(")") }
  ),
  s({ trig = "splice", name = "Array splice", dscr = "Array.prototype.splice()" },
    { t("splice("), i(1, "start"), t(", "), i(2, "deleteCount"), i(3, ", item1, ..."), t(")") }
  ),
  s({ trig = "slice_arr", name = "Array slice", dscr = "Array.prototype.slice()" },
    { t("slice("), i(1, "start"), i(2, ", end"), t(")") }), -- Added distinct trigger
  s({ trig = "join", name = "Array join", dscr = "Array.prototype.join()" },
    { t("join("), i(1, "separator"), t(")") }
  ),
  s({ trig = "findIndex", name = "Array findIndex", dscr = "Array.prototype.findIndex()" },
    { t("findIndex("), fmt([[({}) => {{ {} }}]], { i(1, "element"), i(0) }), t(")") }),                              -- Added
  s({ trig = "fill", name = "Array fill", dscr = "Array.prototype.fill()" },
    { t("fill("), i(1, "value"), i(2, ", start"), i(3, ", end"), t(")") }),                                          -- Added
  s({ trig = "copyWithin", name = "Array copyWithin", dscr = "Array.prototype.copyWithin()" },
    { t("copyWithin("), i(1, "target"), i(2, ", start"), i(3, ", end"), t(")") }),                                   -- Added
  s({ trig = "flat", name = "Array flat", dscr = "Array.prototype.flat()" }, { t("flat("), i(1, "depth"), t(")") }), -- Added
  s({ trig = "flatMap", name = "Array flatMap", dscr = "Array.prototype.flatMap()" },
    { t("flatMap("), fmt([[({}) => {{ {} }}]], { i(1, "currentValue"), i(0) }), t(")") }),                           -- Added
})
