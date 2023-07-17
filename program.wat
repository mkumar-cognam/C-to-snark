(module
  (type (;0;) (func (param i32)))
  (type (;1;) (func (result i32)))
  (import "env" "require" (func (;0;) (type 0)))
  (func (;1;) (type 1) (result i32)
    (local i32 i32 i32 i32)
    i32.const 0
    local.set 3
    block  ;; label = @1
      i32.const 0
      i32.load offset=32
      local.tee 0
      i32.load8_u
      i32.eqz
      br_if 0 (;@1;)
      i32.const 1
      local.set 3
      loop  ;; label = @2
        local.get 0
        local.get 3
        i32.add
        local.set 2
        local.get 3
        i32.const 1
        i32.add
        local.tee 1
        local.set 3
        local.get 2
        i32.load8_u
        br_if 0 (;@2;)
      end
      local.get 1
      i32.const 8
      i32.eq
      local.set 3
    end
    local.get 3
    call 0
    local.get 3)
  (table (;0;) 0 funcref)
  (memory (;0;) 1)
  (export "memory" (memory 0))
  (export "zkmain" (func 1))
  (data (;0;) (i32.const 16) "hello-world\00\00")
  (data (;1;) (i32.const 32) "\10\00\00\00"))
