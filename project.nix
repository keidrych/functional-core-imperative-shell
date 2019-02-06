{ buildNodePackage, namespaces, nodePackages, pkgs }:
buildNodePackage {
    name = "cloud-native-internal";
    version = "0.0.0";
    src = ./.;
    deps = with nodePackages; [
      fastify-blipp_1-2-1
      resquire_1-1-1
      fastify_1-14-1
      fast-json-patch_2-0-7
      per-env_1-0-2
      make-promises-safe_4-0-0
      upath_1-1-0
      rambdax_1-7-1
      debug_4-1-1
      muggle-test_1-0-0
      fastify-sensible_1-0-0
      tap-min_1-3-0
      xxhashjs_0-2-2
      rfdc_1-1-2
      ajv_6-8-1
      await-result_2-2-1
      muggle-assert_1-1-3
      permit_0-2-4
      deeps_1-4-5
      is-installed_2-0-1
      to-json-schema_0-2-0
      redrun_7-1-4
      url-parse_1-4-4
    ];
    optionalDependencies = with nodePackages; [
      fastify-nodemailer_3-0-0
      fastify-server-session_2-0-0
      pbkdf2_3-0-17
      iron_5-0-6
      fastify-cookie_2-1-6
      nanoid_2-0-1
      password-magic_1-0-0
    ];
    devDependencies = with nodePackages; [
      husky_1-3-1
      nyc_13-2-0
      eslint-plugin-ava_5-1-1
      xo_0-24-0
      eslint-plugin-promise_4-0-1
      namespaces.commitlint.lint_7-5-0
      eslint-plugin-node_8-0-1
      namespaces.commitlint.prompt-cli_7-5-0
      eslint_5-13-0
      babel-runtime_6-26-0
      eslint-plugin-prettier_3-0-1
      nock_10-0-6
      eslint-config-prettier_4-0-0
      rxjs-compat_6-4-0
      testdouble_3-10-0
      pino-pretty_2-5-0
      local-repl_4-0-0
      rxjs_6-4-0
      run-node_1-0-0
      gron_4-4-0
      eslint-config-xo_0-26-0
      namespaces.commitlint.cli_7-5-0
      documentary_1-21-1
      eslint-plugin-import_2-16-0
      namespaces.commitlint.config-conventional_7-5-0
      rewire_4-0-1
      supertest_3-4-2
      codecov_3-1-0
      eslint-plugin-no-use-extend-native_0-4-0
      prettier_1-16-4
      acorn_6-0-7
      clear-require_3-0-0
      run-tests_1-0-4
      updates_6-2-4
      lint-staged_8-1-3
      eslint-plugin-unicorn_7-1-0
      fmtconv_1-0-7
      faker_4-1-0
    ];
    meta = {
      homepage = "https://github.com/sotekton/cloud-native-internal#readme";
      description = "Starter scaffold for Internal Cloud Native Applications";
    };
  }
