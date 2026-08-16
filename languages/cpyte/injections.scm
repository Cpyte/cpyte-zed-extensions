; Inject C into ccode: blocks
(ccode_block
  (raw_body_line) @injection.content
  (#set! injection.language "c"))

; Inject LLVM IR into llvm: blocks
(llvm_block
  (raw_body_line) @injection.content
  (#set! injection.language "llvm"))

; Inject LLVM IR into unsafe llvm: blocks
(unsafe_llvm_block
  (raw_body_line) @injection.content
  (#set! injection.language "llvm"))
