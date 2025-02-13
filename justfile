lib_name := "napi_sandbox"

profile := env_var_or_default("profile", "debug")

profile_cargo := \
if \
  profile != "debug" { "--profile " + profile } \
else \
  { "" }


dylib := \
if \
  os() == "Windows_NT" { lib_name + ".dll" } \
else if \
  os() == "macos" { "lib" + lib_name + ".dylib" } \
else if \
  os() == "linux" { "lib" + lib_name + ".so" } \
else \
  { os() }

root_dir :=  justfile_directory()
out_dir :=  join(justfile_directory(), "target", profile)

build:
    cargo build {{profile_cargo}}
    rm -rf {{root_dir}}/napi_sandbox/index.node
    mv {{out_dir}}/{{dylib}} {{root_dir}}/napi_sandbox/index.node

run:
    just build
    node {{root_dir}}/cmd/index.js