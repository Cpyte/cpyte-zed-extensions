; Comments
(comment)+ @comment.around

; Functions
(function_definition
  body: (_) @function.inside) @function.around

; Classes
(class_definition
  body: (_) @class.inside) @class.around

; Structs
(struct_definition
  body: (_) @class.inside) @class.around

; Enums
(enum_definition
  body: (_) @class.inside) @class.around
