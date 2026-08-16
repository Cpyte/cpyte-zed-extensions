; Identifier naming conventions; these "soft conventions" should stay at the top
; of the file as they're often overridden by later, more specific queries.
(identifier) @variable

; CamelCase → type references
((identifier) @type.class
  (#match? @type.class "^[A-Z][A-Za-z0-9_]*$"))

; ALL_CAPS → constants
((identifier) @constant
  (#match? @constant "^_*[A-Z][A-Z0-9_]*$"))

; Member access
(attribute
  attribute: (identifier) @property)

; Function calls
(call
  function: (identifier) @function.call)

(call
  function: (attribute
    attribute: (identifier) @function.method.call))

; Constructor calls (new T(...))
(call
  function: (type
    name: (identifier) @type.call))

; Function definitions
(function_definition
  name: (identifier) @function.definition)

; Parameters
(parameter
  name: (identifier) @variable.parameter)

; Types
(type
  name: (identifier) @type)

((type
  name: (identifier) @type.builtin)
  (#any-of? @type.builtin
    "int" "int64" "uint64" "float" "double" "big" "char" "bool"
    "str" "string" "void" "byte"))

; Type / struct / class / enum definitions
(struct_definition
  name: (identifier) @type.definition)

(class_definition
  name: (identifier) @type.definition)

(enum_definition
  name: (identifier) @type.definition)

(type_alias
  name: (identifier) @type.definition)

(field_declaration
  name: (identifier) @field)

(enum_member
  name: (identifier) @constant)

; Imports
(import_statement
  package: (identifier) @namespace)

(import_statement
  name: (identifier) @namespace)

"@" @punctuation.special

; Builtin input functions
[
  "input"
  "input_str"
  "input_big"
] @function.builtin

; Conversion builtin function calls
((call
  function: (identifier) @function.builtin)
  (#any-of? @function.builtin
    "int" "str" "float" "double"))

; Literals
(number) @number
(string) @string
(comment) @comment

[
  "true"
  "True"
  "false"
  "False"
] @boolean

"null" @constant.builtin

; Keywords
[
  "def"
  "class"
  "struct"
  "enum"
  "type"
] @keyword.definition

[
  "if"
  "elif"
  "else"
] @keyword.conditional

[
  "switch"
  "case"
  "default"
] @keyword.conditional

[
  "while"
  "for"
  "in"
] @keyword.repeat

[
  "try"
  "except"
  "raise"
] @keyword.exception

[
  "return"
  "break"
  "continue"
] @keyword.return

[
  "import"
  "sdk"
] @keyword.import

[
  "public"
  "private"
  "static"
  "virtual"
  "override"
] @keyword

[
  "let"
  "new"
  "sizeof"
  "asm"
  "volatile"
  "ccode"
  "llvm"
  "unsafe"
] @keyword

; Logical operators
[
  "and"
  "or"
  "not"
] @keyword.operator

; Punctuation
[
  "."
  ","
  ":"
] @punctuation.delimiter

[
  "("
  ")"
  "["
  "]"
] @punctuation.bracket

; Operators
[
  "="
  "+="
  "-="
  "*="
  "/="
  "//="
  "=="
  "!="
  "<"
  ">"
  "<="
  ">="
  "<<"
  ">>"
  "+"
  "-"
  "*"
  "/"
  "//"
  "%"
  "**"
  "&"
  "|"
  "^"
  "~"
  "->"
] @operator
