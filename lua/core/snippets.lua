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
    snip("state", {
        text("const ["),
        insert(1, "state"),
        text(", set"),
        insert(2, "State"),
        text("] = useState<"),
        insert(3, "type"),
        text(">("),
        insert(4, "initialValue"),
        text(")"),
    }),
}


-- export const AppContext = createContext<any>({})
-- export const AppContextProvider = ({ children }: any) => {
--     const [language, setLanguage] = useState<keyof typeof translations>('en');
--     const [page, setPage] = useState<Page>(Page.Renew);
--
--     const [userIdentifier, setUserIdentifier] = useState<string | null>(null)
--
--     useEffect(() => {
--         const browserLanguage = navigator.language.split('-')[0]
--         if (Object.keys(translations).includes(browserLanguage)) {
--             setLanguage(browserLanguage as keyof typeof translations)
--         }
--
--         var userIdentifier = new URLSearchParams(window.location.search).get('userId')
--
--         setUserIdentifier(userIdentifier)
--
--         if (userIdentifier) {
--             setPage(Page.Home)
--         }
--     }, [])
--
--
--     return (
--         <AppContext.Provider value={{
--             language: language,
--             setLanguage: setLanguage,
--             page: page,
--             setPage: setPage,
--             userIdentifier: userIdentifier
--         }}>
--             {children}
--         </AppContext.Provider>
--     )
-- }

ls.add_snippets("typescript", reactSnippets)
ls.add_snippets("javascript", reactSnippets)
ls.add_snippets("typescriptreact", reactSnippets)
