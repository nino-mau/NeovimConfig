local ls = require("luasnip")
local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.f -- function node

-- Helper function to get filename base, used in snippets
local function get_filename_base()
  return { vim.fn.expand("%:t:r") }
end

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

  s({ trig = "sim", name = "setImmediate", dscr = "setImmediate(() => { ... })" },
    fmt(
      [[
      setImmediate(() => {{
      	{}
      }})
      ]],
      { i(0) }
    )
  ),

  s({ trig = "a", name = "await", dscr = "await value" },
    { t("await "), i(1, "value") }
  ),

  -- Note: Cleaned up significantly due to unusual formatting in original JSON
  s({ trig = "apad", name = "await Promise.all with destructuring", dscr = "const [...] = await Promise.all(...)" },
    fmt(
      [[
      const [{}] = await Promise.all({})
      ]],
      { i(1), i(2, "promises") }
    )
  ),

  -- Note: Cleaned up significantly
  s({ trig = "apm", name = "await Promise.all map", dscr = "await Promise.all(array.map(async ...))" },
    fmt(
      [[
      await Promise.all({}.map(async ({}) => {{
      	{}
      }}))
      ]],
      { i(1, "array"), i(2, "item"), i(0) }
    )
  ),

  s({ trig = "ast", name = "await sleep", dscr = "await new Promise((r) => setTimeout(r, ms))" },
    fmt(
      [[
      await new Promise((r) => setTimeout(r, {}))
      ]],
      { i(1, "ms") }
    )
  ),

  s({ trig = "cb", name = "Node callback", dscr = "function (err, result) { ... }" },
    fmt(
      [[
      function (err, {}) {{
      	{}
      }}
      ]],
      { i(1, "result"), i(0) }
    )
  ),

  s({ trig = "pe", name = "process.env", dscr = "process.env" },
    { t("process.env") }
  ),

  s({ trig = "pa", name = "Promise.all", dscr = "Promise.all(...)" },
    fmt(
      [[
      Promise.all({})
      ]],
      { i(1, "iterable") }
    )
  ),

  s({ trig = "prj", name = "Promise.reject", dscr = "Promise.reject(...)" },
    fmt(
      [[
      Promise.reject({})
      ]],
      { i(1, "reason") }
    )
  ),

  -- Note: Cleaned up significantly
  s({ trig = "pt", name = "Promise.then", dscr = "promise.then(...)" },
    fmt(
      [[
      {}.then(({}) => {{
      	{}
      }})
      ]],
      { i(1, "promise"), i(2, "value"), i(0) }
    )
  ),

  s({ trig = "pc", name = "Promise.catch", dscr = "promise.catch(...)" },
    fmt(
      [[
      {}.catch(error => {{
      	{}
      }})
      ]],
      { i(1, "promise"), i(0) }
    )
  ),

  -- Note: Cleaned up significantly
  s({ trig = "desc", name = "describe block", dscr = "describe('...', () => { ... })" },
    fmt(
      [[
      describe('{}', () => {{
      	{}
      }})
      ]],
      { i(1, "description"), i(0) }
    )
  ),

  s({ trig = "descfn", name = "describe block with filename", dscr = "describe (filename, () => { ... })" },
    fmt(
      [[
          describe('{}', () => {{
              {}
          }})
          ]],
      { f(get_filename_base, {}), i(0) }
    )
  ),


  s({ trig = "desca", name = "describe async block", dscr = "describe('...', async () => { ... })" },
    fmt(
      [[
      describe('{}', async () => {{
      	{}
      }})
      ]],
      { i(1, "description"), i(0) }
    )
  ),

  s({ trig = "it", name = "it block", dscr = "it('...', () => { ... })" },
    fmt(
      [[
      it('{}', () => {{
      	{}
      }})
      ]],
      { i(1, "description"), i(0) }
    )
  ),

  s({ trig = "itd", name = "it with a callback", dscr = "it('...', (done) => { ... })" },
    fmt(
      [[
      it('{}', (done) => {{
      	{}
      	done();
      }})
      ]],
      { i(1, "description"), i(0) }
    )
  ),

  s({ trig = "its", name = "it synchronous", dscr = "it('...', () => { ... })" },
    fmt(
      [[
      it('{}', () => {{
      	{}
      }})
      ]],
      { i(1, "description"), i(0) }
    )
  ),

  s({ trig = "bf", name = "before", dscr = "before(async () => { ... })" },
    fmt(
      [[
      before(async () => {{
      	{}
      }})
      ]],
      { i(0) }
    )
  ),

  s({ trig = "bfe", name = "beforeEach", dscr = "beforeEach(async () => { ... })" },
    fmt(
      [[
      beforeEach(async () => {{
      	{}
      }})
      ]],
      { i(0) }
    )
  ),

  s({ trig = "afe", name = "afterEach", dscr = "afterEach(() => { ... })" },
    fmt(
      [[
          afterEach(() => {{
              {}
          }})
          ]],
      { i(0) }
    )
  ),

  -- Note: Cleaned up significantly
  s({ trig = "cr", name = "const module = require('module')", dscr = "const module = require('module')" },
    fmt(
      [[
      const {} = require('{}')
      ]],
      { i(1, "moduleName"), i(2, "module") }
    )
  ),

  s({ trig = "em", name = "exports.member", dscr = "exports.member = value" },
    fmt(
      [[
      exports.{} = {}
      ]],
      { i(1, "member"), i(2, "value") }
    )
  ),

  s({ trig = "me", name = "module.exports", dscr = "module.exports = name" },
    fmt(
      [[
      module.exports = {}
      ]],
      { i(1, "name") }
    )
  ),

  -- Note: Cleaned up significantly
  s({ trig = "mec", name = "module as class", dscr = "Class definition exported" },
    fmt(
      [[
      class {} {{
      	constructor({}) {{
      		{}
      	}}
      }}

      module.exports = {}
      ]],
      { i(1, "ClassName"), i(2, "arguments"), i(0), rep(1) }
    )
  ),

  -- Note: Cleaned up significantly
  s({ trig = "on", name = "emitter.on", dscr = "emitter.on('event', ...)" },
    fmt(
      [[
      {}.on('{}', ({}) => {{
      	{}
      }})
      ]],
      { i(1, "emitter"), i(2, "event"), i(3, "args"), i(0) }
    )
  ),

  s({ trig = "ael", name = "addEventListener", dscr = "element.addEventListener" },
    fmt(
      [[
      {}.addEventListener('{}', ({}) => {{
      	{}
      }})
      ]],
      { i(1, "element"), i(2, "event"), i(3, "e"), i(0) }
    )
  ),

  s({ trig = "rel", name = "removeEventListener", dscr = "element.removeEventListener" },
    fmt(
      [[
      {}.removeEventListener('{}', {})
      ]],
      { i(1, "element"), i(2, "event"), i(3, "handler") }
    )
  ),

  s({ trig = "gi", name = "getElementById", dscr = "document.getElementById" },
    fmt([[document.getElementById('{}')]], { i(1, "id") })
  ),

  s({ trig = "gc", name = "getElementsByClassName", dscr = "document.getElementsByClassName" },
    fmt([[document.getElementsByClassName('{}')]], { i(1, "className") })
  ),

  s({ trig = "gt", name = "getElementsByTagName", dscr = "document.getElementsByTagName" },
    fmt([[document.getElementsByTagName('{}')]], { i(1, "tagName") })
  ),

  s({ trig = "qs", name = "querySelector", dscr = "document.querySelector" },
    fmt([[document.querySelector('{}')]], { i(1, "selector") })
  ),

  s({ trig = "qsa", name = "querySelectorAll", dscr = "document.querySelectorAll" },
    fmt([[document.querySelectorAll('{}')]], { i(1, "selector") })
  ),

  s({ trig = "cdf", name = "createDocumentFragment", dscr = "document.createDocumentFragment" },
    { t("document.createDocumentFragment()") }
  ),

  s({ trig = "ce", name = "createElement", dscr = "document.createElement" },
    fmt([[document.createElement('{}')]], { i(1, "tagName") })
  ),

  s({ trig = "cla", name = "classList.add", dscr = "element.classList.add" },
    fmt([[ {}.classList.add('{}') ]], { i(1, "el"), i(2, "className") })
  ),

  s({ trig = "clr", name = "classList.remove", dscr = "element.classList.remove" },
    fmt([[ {}.classList.remove('{}') ]], { i(1, "el"), i(2, "className") })
  ),

  s({ trig = "clt", name = "classList.toggle", dscr = "element.classList.toggle" },
    fmt([[ {}.classList.toggle('{}') ]], { i(1, "el"), i(2, "className") })
  ),

  s({ trig = "ga", name = "getAttribute", dscr = "element.getAttribute" },
    fmt([[ {}.getAttribute('{}') ]], { i(1, "el"), i(2, "attr") })
  ),

  s({ trig = "ra", name = "removeAttribute", dscr = "element.removeAttribute" },
    fmt([[ {}.removeAttribute('{}') ]], { i(1, "el"), i(2, "attr") })
  ),

  s({ trig = "sa", name = "setAttribute", dscr = "element.setAttribute" },
    fmt([[ {}.setAttribute('{}', {}) ]], { i(1, "el"), i(2, "attr"), i(3, "value") })
  ),

  s({ trig = "ac", name = "appendChild", dscr = "element.appendChild" },
    fmt([[ {}.appendChild({}) ]], { i(1, "el"), i(2, "child") })
  ),

  s({ trig = "rc", name = "removeChild", dscr = "element.removeChild" },
    fmt([[ {}.removeChild({}) ]], { i(1, "el"), i(2, "child") })
  ),

  s({ trig = "fe", name = "forEach loop", dscr = "iterable.forEach(...)" },
    fmt(
      [[
      {}.forEach(({}) => {{
      	{}
      }})
      ]],
      { i(1, "iterable"), i(2, "item"), i(0) }
    )
  ),

  s({ trig = "map", name = "map function", dscr = "iterable.map(...)" },
    fmt(
      [[
      {}.map(({}) => {{
      	{}
      }})
      ]],
      { i(1, "iterable"), i(2, "item"), i(0) }
    )
  ),

  s({ trig = "reduce", name = "reduce function", dscr = "iterable.reduce(...)" },
    fmt(
      [[
      {}.reduce(({}, {}) => {{
      	{}
      }}, {})
      ]],
      { i(1, "iterable"), i(2, "accumulator"), i(3, "currentValue"), i(0), i(4, "initialValue") }
    )
  ),

  s({ trig = "filter", name = "filter function", dscr = "iterable.filter(...)" },
    fmt(
      [[
      {}.filter(({}) => {{
      	{}
      }})
      ]],
      { i(1, "iterable"), i(2, "item"), i(0) }
    )
  ),

  s({ trig = "find", name = "find function", dscr = "iterable.find(...)" },
    fmt(
      [[
      {}.find(({}) => {{
      	{}
      }})
      ]],
      { i(1, "iterable"), i(2, "item"), i(0) }
    )
  ),

  s({ trig = "every", name = "every function", dscr = "iterable.every(...)" },
    fmt(
      [[
      {}.every(({}) => {{
      	{}
      }})
      ]],
      { i(1, "iterable"), i(2, "item"), i(0) }
    )
  ),

  s({ trig = "some", name = "some function", dscr = "iterable.some(...)" },
    fmt(
      [[
      {}.some(({}) => {{
      	{}
      }})
      ]],
      { i(1, "iterable"), i(2, "item"), i(0) }
    )
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

  s(
    {
      trig = "gari",
      name = "generate array of integers starting with 1",
      dscr =
      "Array.from({ length: N }).keys() starting at 1"
    },
    fmt([[Array.from({{ length: {} }}, (_, i) => i + 1)]], { i(1, "length") }) -- Adjusted to start at 1
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
  s({ trig = "im", name = "import module", dscr = "import * as name from 'module'" },
    fmt([[import * as {} from '{}';]], { i(2, "name"), i(1, "module") })
  ),

  -- Note: Cleaned up significantly
  s({ trig = "ia", name = "import module as", dscr = "import defaultExport as name from 'module'" },
    fmt([[import {} as {} from '{}';]], { i(2, "defaultExport"), i(3, "name"), i(1, "module") })
  ),

  s({ trig = "id", name = "import module destructured", dscr = "import { member } from 'module'" },
    fmt([[import {{ {} }} from '{}';]], { i(2, "member"), i(1, "module") })
  ),

  s({ trig = "ida", name = "import module destructured as", dscr = "import { member as alias } from 'module'" },
    fmt([[import {{ {} as {} }} from '{}';]], { i(2, "member"), i(3, "alias"), i(1, "module") })
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


  s({ trig = "wid", name = "while iteration decrementing", dscr = "while loop decrementing index" },
    fmt(
      [[
      let {}Index = {}.length - 1;
      while ({}Index >= 0) {{
      	const element = {}[{}Index];
      	{}
      	{}Index--;
      }}
      ]],
      { i(1, "array"), rep(1), rep(1), rep(1), rep(1), i(0), rep(1) }
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

  s({ trig = "iife", name = "immediately-invoked function expression", dscr = "(function(...) { ... })()" },
    fmt(
      [[
      (function({}) {{
      	{}
      }})({})
      ]],
      { i(1, "args"), i(0), i(2) }
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

  s({ trig = "uss", name = "use strict", dscr = "'use strict'" },
    { t("'use strict';") }
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

  s({ trig = "get", name = "getter", dscr = "get property() { ... }" },
    fmt(
      [[
      get {}() {{
      	return {};
      }}
      ]],
      { i(1, "propertyName"), i(0) }
    )
  ),

  -- Note: Cleaned up significantly
  s({ trig = "set", name = "setter", dscr = "set property(value) { ... }" },
    fmt(
      [[
      set {}({}) {{
      	{}
      }}
      ]],
      { i(1, "propertyName"), i(2, "value"), i(0) }
    )
  ),

  -- Note: Cleaned up significantly
  s({ trig = "gs", name = "getter + setter", dscr = "get/set property" },
    fmt(
      [[
      get {}() {{
      	return this._{};
      }}
      set {}({}) {{
      	this._{} = {};
      	{}
      }}
      ]],
      { i(1, "propertyName"), rep(1), rep(1), i(2, "value"), rep(1), rep(2), i(0) }
    )
  ),

  -- Note: Cleaned up significantly
  s({ trig = "proto", name = "prototype method", dscr = "Class.prototype.method = function(...) { ... }" },
    fmt(
      [[
      {}.prototype.{} = function({}) {{
      	{}
      }}
      ]],
      { i(1, "ClassName"), i(2, "methodName"), i(3, "args"), i(0) }
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

  -- This snippet is intended for visual mode selection.
  -- Defining it this way makes it a standard snippet where you replace the placeholder.
  -- For true visual mode use: `luasnip.parser.parse_snippet({trig="wrap", snippetType="visual"}, "() => {{\n\t${1}\n}}")`
  s({ trig = "wrap", name = "wrap selection in arrow function", dscr = "wraps text in arrow function" },
    fmt(
      [[
      () => {{
      	{}
      }}
      ]],
      -- Using i(1) as a placeholder for the selected text
      { i(1, "selected_text") }
    )
  ),

  s({ trig = "define", name = "define module", dscr = "define AMD module" },
    {
      t("define(["),
      t("\n\t'require',"),
      t("\n\t'"), i(1, "dependency"), t("',"),
      t("\n], function(require, "), i(2, "factory"), t(") {"),
      t("\n\t"), i(0),
      t("\n});")
    }
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

  -- String methods (simplified some bodies)
  s({ trig = "charAt", name = "String charAt", dscr = "String.prototype.charAt()" },
    { t("charAt("), i(1, "index"), t(")") }
  ),
  s({ trig = "concat", name = "String concat", dscr = "String.prototype.concat()" },
    { t("concat("), i(1, "string2"), t(")") }
  ),
  s({ trig = "includes", name = "String includes", dscr = "String.prototype.includes()" },
    { t("includes("), i(1, "searchString"), t(")") }
  ),
  s({ trig = "endsWith", name = "String endsWith", dscr = "String.prototype.endsWith()" },
    { t("endsWith("), i(1, "searchString"), t(")") }
  ),
  s({ trig = "indexOf", name = "String indexOf", dscr = "String.prototype.indexOf()" },
    { t("indexOf("), i(1, "searchValue"), t(")") }
  ),
  s({ trig = "lastIndexOf", name = "String lastIndexOf", dscr = "String.prototype.lastIndexOf()" },
    { t("lastIndexOf("), i(1, "searchValue"), t(")") }
  ),
  s({ trig = "match", name = "String match", dscr = "String.prototype.match()" },
    { t("match("), i(1, "regexp"), t(")") }
  ),
  s({ trig = "matchAll", name = "String matchAll", dscr = "String.prototype.matchAll()" },
    { t("matchAll("), i(1, "regexp"), t(")") }
  ),
  s({ trig = "padEnd", name = "String padEnd", dscr = "String.prototype.padEnd()" },
    { t("padEnd("), i(1, "targetLength"), t(", "), i(2, "' '"), t(")") }
  ),
  s({ trig = "padStart", name = "String padStart", dscr = "String.prototype.padStart()" },
    { t("padStart("), i(1, "targetLength"), t(", "), i(2, "' '"), t(")") }
  ),
  s({ trig = "repeat", name = "String repeat", dscr = "String.prototype.repeat()" },
    { t("repeat("), i(1, "count"), t(")") }
  ),
  s({ trig = "replace", name = "String replace", dscr = "String.prototype.replace()" },
    { t("replace("), i(1, "pattern"), t(", "), i(2, "replacement"), t(")") }
  ),
  s({ trig = "replaceAll", name = "String replaceAll", dscr = "String.prototype.replaceAll()" },
    { t("replaceAll("), i(1, "pattern"), t(", "), i(2, "replacement"), t(")") }
  ),
  s({ trig = "search", name = "String search", dscr = "String.prototype.search()" },
    { t("search("), i(1, "regexp"), t(")") }
  ),
  s({ trig = "slice", name = "String slice", dscr = "String.prototype.slice()" },
    { t("slice("), i(1, "beginIndex"), i(2, ", endIndex"), t(")") }
  ),
  s({ trig = "split", name = "String split", dscr = "String.prototype.split()" },
    { t("split("), i(1, "separator"), i(2, ", limit"), t(")") }
  ),
  s({ trig = "startsWith", name = "String startsWith", dscr = "String.prototype.startsWith()" },
    { t("startsWith("), i(1, "searchString"), i(2, ", position"), t(")") }
  ),
  s({ trig = "substring", name = "String substring", dscr = "String.prototype.substring()" },
    { t("substring("), i(1, "indexStart"), i(2, ", indexEnd"), t(")") }
  ),
  s({ trig = "toLocaleLowerCase", name = "String toLocaleLowerCase", dscr = "String.prototype.toLocaleLowerCase()" },
    { t("toLocaleLowerCase("), i(1, "locale"), t(")") }
  ),
  s({ trig = "toLocaleUpperCase", name = "String toLocaleUpperCase", dscr = "String.prototype.toLocaleUpperCase()" },
    { t("toLocaleUpperCase("), i(1, "locale"), t(")") }
  ),
  s({ trig = "toLowerCase", name = "String toLowerCase", dscr = "String.prototype.toLowerCase()" },
    { t("toLowerCase()") }
  ),
  s({ trig = "toString", name = "String toString", dscr = "String.prototype.toString()" },
    { t("toString()") }
  ),
  s({ trig = "toUpperCase", name = "String toUpperCase", dscr = "String.prototype.toUpperCase()" },
    { t("toUpperCase()") }
  ),
  s({ trig = "trim", name = "String trim", dscr = "String.prototype.trim()" }, { t("trim()") }),                     -- Added
  s({ trig = "trimStart", name = "String trimStart", dscr = "String.prototype.trimStart()" }, { t("trimStart()") }), -- Added
  s({ trig = "trimEnd", name = "String trimEnd", dscr = "String.prototype.trimEnd()" }, { t("trimEnd()") }),         -- Added
  s({ trig = "valueOf", name = "String valueOf", dscr = "String.prototype.valueOf()" },
    { t("valueOf()") }
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

  -- Function methods
  s({ trig = "apply", name = "Function apply", dscr = "Function.prototype.apply()" },
    { t("apply("), i(1, "thisArg"), t(", "), i(2, "argsArray"), t(")") }
  ),
  s({ trig = "bind", name = "Function bind", dscr = "Function.prototype.bind()" },
    { t("bind("), i(1, "thisArg"), i(2, ", arg1, ..."), t(")") }
  ),
  s({ trig = "call", name = "Function call", dscr = "Function.prototype.call()" },
    { t("call("), i(1, "thisArg"), i(2, ", arg1, ..."), t(")") }
  ),

  -- Object methods (some already covered, adding missing common ones)
  s({ trig = "hasOwnProperty", name = "Object hasOwnProperty", dscr = "Object.prototype.hasOwnProperty()" },
    { t("hasOwnProperty("), i(1, "prop"), t(")") }),
  s({ trig = "isPrototypeOf", name = "Object isPrototypeOf", dscr = "Object.prototype.isPrototypeOf()" },
    { t("isPrototypeOf("), i(1, "object"), t(")") }),
  s(
    {
      trig = "propertyIsEnumerable",
      name = "Object propertyIsEnumerable",
      dscr =
      "Object.prototype.propertyIsEnumerable()"
    },
    { t("propertyIsEnumerable("), i(1, "prop"), t(")") }),
  s({ trig = "freeze", name = "Object freeze", dscr = "Object.freeze()" }, { t("Object.freeze("), i(1, "obj"), t(")") }),
  s({ trig = "seal", name = "Object seal", dscr = "Object.seal()" }, { t("Object.seal("), i(1, "obj"), t(")") }),
  s({ trig = "preventExtensions", name = "Object preventExtensions", dscr = "Object.preventExtensions()" },
    { t("Object.preventExtensions("), i(1, "obj"), t(")") }),
  s({ trig = "isFrozen", name = "Object isFrozen", dscr = "Object.isFrozen()" },
    { t("Object.isFrozen("), i(1, "obj"), t(")") }),
  s({ trig = "isSealed", name = "Object isSealed", dscr = "Object.isSealed()" },
    { t("Object.isSealed("), i(1, "obj"), t(")") }),
  s({ trig = "isExtensible", name = "Object isExtensible", dscr = "Object.isExtensible()" },
    { t("Object.isExtensible("), i(1, "obj"), t(")") }),
  s({ trig = "getPrototypeOf", name = "Object getPrototypeOf", dscr = "Object.getPrototypeOf()" },
    { t("Object.getPrototypeOf("), i(1, "obj"), t(")") }),

  -- HTMLElement methods
  s({ trig = "focus", name = "HTMLElement focus", dscr = "HTMLElement.focus()" },
    { t("focus()") }
  ),
  s({ trig = "blur", name = "HTMLElement blur", dscr = "HTMLElement.blur()" },
    { t("blur()") }
  ),
  s({ trig = "click", name = "HTMLElement click", dscr = "HTMLElement.click()" }, { t("click()") }), -- Added
  s({ trig = "innerText", name = "HTMLElement innerText", dscr = "HTMLElement.innerText property" },
    { t("innerText") }
  ),
  s({ trig = "innerHTML", name = "HTMLElement innerHTML", dscr = "HTMLElement.innerHTML property" }, { t("innerHTML") }), -- Added
  s({ trig = "outerHTML", name = "HTMLElement outerHTML", dscr = "HTMLElement.outerHTML property" }, { t("outerHTML") }), -- Added
  s({ trig = "textContent", name = "Node textContent", dscr = "Node.textContent property" }, { t("textContent") }),       -- Added

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

  -- Date methods
  s({ trig = "now", name = "Date now", dscr = "Date.now()" }, { t("Date.now()") }), -- Added
  s({ trig = "getDate", name = "Date getDate", dscr = "Date.prototype.getDate()" }, { t("getDate()") }),
  s({ trig = "getDay", name = "Date getDay", dscr = "Date.prototype.getDay()" }, { t("getDay()") }),
  s({ trig = "getFullYear", name = "Date getFullYear", dscr = "Date.prototype.getFullYear()" }, { t("getFullYear()") }),
  s({ trig = "getHours", name = "Date getHours", dscr = "Date.prototype.getHours()" }, { t("getHours()") }),
  s({ trig = "getMilliseconds", name = "Date getMilliseconds", dscr = "Date.prototype.getMilliseconds()" },
    { t("getMilliseconds()") }),
  s({ trig = "getMinutes", name = "Date getMinutes", dscr = "Date.prototype.getMinutes()" }, { t("getMinutes()") }),
  s({ trig = "getMonth", name = "Date getMonth", dscr = "Date.prototype.getMonth()" }, { t("getMonth()") }),
  s({ trig = "getSeconds", name = "Date getSeconds", dscr = "Date.prototype.getSeconds()" }, { t("getSeconds()") }),
  s({ trig = "getTime", name = "Date getTime", dscr = "Date.prototype.getTime()" }, { t("getTime()") }),
  s({ trig = "getTimezoneOffset", name = "Date getTimezoneOffset", dscr = "Date.prototype.getTimezoneOffset()" },
    { t("getTimezoneOffset()") }),
  s({ trig = "setDate", name = "Date setDate", dscr = "Date.prototype.setDate()" },
    { t("setDate("), i(1, "dayValue"), t(")") }),
  s({ trig = "setFullYear", name = "Date setFullYear", dscr = "Date.prototype.setFullYear()" },
    { t("setFullYear("), i(1, "yearValue"), i(2, ", monthValue"), i(3, ", dateValue"), t(")") }),
  s({ trig = "setHours", name = "Date setHours", dscr = "Date.prototype.setHours()" },
    { t("setHours("), i(1, "hoursValue"), i(2, ", minutesValue"), i(3, ", secondsValue"), i(4, ", msValue"), t(")") }),
  s({ trig = "setMilliseconds", name = "Date setMilliseconds", dscr = "Date.prototype.setMilliseconds()" },
    { t("setMilliseconds("), i(1, "msValue"), t(")") }),
  s({ trig = "setMinutes", name = "Date setMinutes", dscr = "Date.prototype.setMinutes()" },
    { t("setMinutes("), i(1, "minutesValue"), i(2, ", secondsValue"), i(3, ", msValue"), t(")") }),
  s({ trig = "setMonth", name = "Date setMonth", dscr = "Date.prototype.setMonth()" },
    { t("setMonth("), i(1, "monthValue"), i(2, ", dateValue"), t(")") }),
  s({ trig = "setSeconds", name = "Date setSeconds", dscr = "Date.prototype.setSeconds()" },
    { t("setSeconds("), i(1, "secondsValue"), i(2, ", msValue"), t(")") }),
  s({ trig = "setTime", name = "Date setTime", dscr = "Date.prototype.setTime()" },
    { t("setTime("), i(1, "timeValue"), t(")") }),
  s({ trig = "toDateString", name = "Date toDateString", dscr = "Date.prototype.toDateString()" },
    { t("toDateString()") }
  ),
  s({ trig = "toISOString", name = "Date toISOString", dscr = "Date.prototype.toISOString()" }, { t("toISOString()") }),
  s({ trig = "toJSON", name = "Date toJSON", dscr = "Date.prototype.toJSON()" },
    { t("toJSON()") }
  ),
  s({ trig = "toLocaleDateString", name = "Date toLocaleDateString", dscr = "Date.prototype.toLocaleDateString()" },
    { t("toLocaleDateString("), i(1, "locales"), i(2, ", options"), t(")") }),
  s({ trig = "toLocaleStringDate", name = "Date toLocaleString", dscr = "Date.prototype.toLocaleString()" },
    { t("toLocaleString("), i(1, "locales"), i(2, ", options"), t(")") }), -- Renamed trigger
  s({ trig = "toLocaleTimeString", name = "Date toLocaleTimeString", dscr = "Date.prototype.toLocaleTimeString()" },
    { t("toLocaleTimeString("), i(1, "locales"), i(2, ", options"), t(")") }),
  s({ trig = "toTimeString", name = "Date toTimeString", dscr = "Date.prototype.toTimeString()" },
    { t("toTimeString()") }),
  s({ trig = "toUTCString", name = "Date toUTCString", dscr = "Date.prototype.toUTCString()" }, { t("toUTCString()") }),
})
