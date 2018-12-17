{ buildNodePackage, namespaces, nodePackages, pkgs }:
buildNodePackage {
    name = "cloud-native-internal";
    version = "0.0.0";
    src = ./.;
    deps = with nodePackages; [
      fastify-blipp_1-2-1
      resquire_1-1-1
      fastify_1-13-2
      fast-json-patch_2-0-7
      per-env_1-0-2
      make-promises-safe_4-0-0
      upath_1-1-0
      rambdax_1-3-0
      debug_4-1-0
      fastify-sensible_0-2-0
      xxhashjs_0-2-2
      rfdc_1-1-2
      ajv_6-6-2
      await-result_2-2-1
      zora_2-0-1
      permit_0-2-4
      deeps_1-4-5
      is-installed_2-0-1
      to-json-schema_0-2-0
      redrun_7-0-3
      url-parse_1-4-4
    ];
    optionalDependencies = with nodePackages; [
      fastify-nodemailer_1-4-1
      fastify-server-session_2-0-0
      pbkdf2_3-0-17
      iron_5-0-6
      fastify-cookie_2-1-4
      nanoid_2-0-0
      password-magic_1-0-0
    ];
    devDependencies = with nodePackages; [
      husky_1-2-1
      nyc_13-1-0
      updated_1-3-0
      eslint-plugin-ava_5-1-1
      xo_0-23-0
      eslint-plugin-promise_4-0-1
      npm-check_5-9-0
      namespaces.commitlint.lint_7-2-1
      eslint-plugin-node_8-0-0
      namespaces.commitlint.prompt-cli_7-2-1
      eslint_5-10-0
      eslint-plugin-prettier_3-0-0
      nock_10-0-4
      eslint-config-prettier_3-3-0
      testdouble_3-9-1
      pino-pretty_2-5-0
      local-repl_4-0-0
      tap-mocha-reporter_3-0-7
      eslint-config-xo_0-25-1
      namespaces.commitlint.cli_7-2-1
      npm-pin-dependencies_1-0-1
      documentary_1-20-1
      eslint-plugin-import_2-14-0
      namespaces.commitlint.config-conventional_7-1-2
      rewire_4-0-1
      supertest_3-3-0
      codecov_3-1-0
      eslint-plugin-no-use-extend-native_0-3-12
      prettier_1-15-3
      acorn_6-0-4
      clear-require_3-0-0
      run-tests_1-0-4
      lint-staged_8-1-0
      eslint-plugin-unicorn_6-0-1
      faker_4-1-0
    ];
    meta = {
      homepage = "https://github.com/sotekton/cloud-native-internal#readme";
      description = "Starter scaffold for Internal Cloud Native Applications";
    };
  }
