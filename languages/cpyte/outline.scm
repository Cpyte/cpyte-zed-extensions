; Defs
(function_definition
  "def" @context
  name: (identifier) @name) @item

; Classes
(class_definition
  "class" @context
  name: (identifier) @name) @item

; Structs
(struct_definition
  "struct" @context
  name: (identifier) @name) @item

; Enums
(enum_definition
  "enum" @context
  name: (identifier) @name) @item

; Type aliases
(type_alias
  "type" @context
  name: (identifier) @name) @item
