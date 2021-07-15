
variant = lower( variant or 'debug' );

local cc = require 'forge.cc' {
    identifier = 'cc_${platform}_${architecture}';
    platform = operating_system();
    bin = root( ('%s/bin'):format(variant) );
    lib = root( ('%s/lib'):format(variant) );
    obj = root( ('%s/obj'):format(variant) );
    include_directories = {
        root( 'physx/include' );
        root( 'pxshared/include' );
    };
    library_directories = {
        root( ('%s/lib'):format(variant) );
    };
    defines = {
        variant ~= 'shipping' and 'NDEBUG' or '_DEBUG';
    };

    architecture = 'native';
    assertions = variant ~= 'shipping';
    debug = variant ~= 'shipping';
    debuggable = variant ~= 'shipping';
    exceptions = true;
    fast_floating_point = variant ~= 'debug';
    incremental_linking = variant == 'debug';
    link_time_code_generation = variant == 'shipping';
    lua_enabled = true;
    minimal_rebuild = variant == 'debug';
    optimization = variant ~= 'debug';
    run_time_checks = variant == 'debug';
    runtime_library = variant == 'debug' and 'static_debug' or 'static_release';
    run_time_type_info = true;
    stack_size = 1048576;
    standard = 'c++17';
    string_pooling = variant == 'shipping';
    strip = false;
    unit_tests_enabled = true;
    warning_level = 3;
    warnings_as_errors = true;
};

buildfile 'physx.forge';
