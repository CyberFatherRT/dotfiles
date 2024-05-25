(const_declaration
    (const_spec
        name: (identifier) @name (#eq? @name scheme)
        value: (expression_list
            (raw_string_literal) @injection.content
        )
        (#offset! @injection.content 0 1 -1 0)
        (#set! injection.language "sql")
    )
)

