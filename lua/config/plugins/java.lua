local function mason_path(package)
  local ok, registry = pcall(require, "mason-registry")
  if not ok or not registry.has_package(package) then
    return nil
  end
  local item = registry.get_package(package)
  return item:is_installed() and item:get_install_path() or nil
end

local function add_glob(target, pattern, exclude)
  for _, path in ipairs(vim.split(vim.fn.glob(pattern), "\n", { trimempty = true })) do
    local name = vim.fs.basename(path)
    if not exclude or not vim.tbl_contains(exclude, name) then
      target[#target + 1] = path
    end
  end
end

return function()
  local jdtls = require("jdtls")
  local root = vim.fs.root(0, { "gradlew", "mvnw", "pom.xml", "build.gradle", "settings.gradle", ".git" })
  if not root then
    return
  end

  local bundles = {}
  local java_debug = mason_path("java-debug-adapter")
  local java_test = mason_path("java-test")
  if java_debug then
    add_glob(bundles, java_debug .. "/extension/server/com.microsoft.java.debug.plugin-*.jar")
  end
  if java_test then
    add_glob(bundles, java_test .. "/extension/server/*.jar", {
      "com.microsoft.java.test.runner-jar-with-dependencies.jar",
      "jacocoagent.jar",
    })
  end

  local project = vim.fs.basename(root)
  local workspace = vim.fn.stdpath("data") .. "/jdtls-workspaces/" .. project
  local capabilities = require("cmp_nvim_lsp").default_capabilities()
  local java_runtime = "/usr/lib/jvm/java-21-openjdk/bin/java"
  if vim.fn.executable(java_runtime) ~= 1 then
    java_runtime = "/usr/lib/jvm/java-26-openjdk/bin/java"
  end
  if vim.fn.executable(java_runtime) ~= 1 then
    java_runtime = vim.fn.exepath("java")
  end
  jdtls.start_or_attach({
    cmd = { "jdtls", "--java-executable", java_runtime, "-data", workspace },
    root_dir = root,
    capabilities = capabilities,
    init_options = { bundles = bundles },
    settings = { java = { signatureHelp = { enabled = true } } },
  })

  if #bundles > 0 then
    jdtls.setup_dap({ hotcodereplace = "auto" })
  end
end
