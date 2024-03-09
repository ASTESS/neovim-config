local ls = require("luasnip")
local snip = ls.snippet
local text = ls.text_node
local insert = ls.insert_node

ls.setup({})

ls.add_snippets("all", {
})

local reactSnippets = {
    snip("fn", {
        text("function "),
        insert(1, "name"),
        text("("),
        insert(2, "args"),
        text(") {"),
        insert(0, ""),
        text("}"),
    }),
    snip("edf", {
        text("export default function "),
        insert(1, "name"),
        text("("),
        insert(2, "args: any"),
        text(") {"),
        insert(0, ""),
        text("}"),
    }),
}

ls.add_snippets("typescript", reactSnippets)
ls.add_snippets("javascript", reactSnippets)
ls.add_snippets("typescriptreact", reactSnippets)
