/**
 *  Copyright 2017 darkoverlordofdata
 *
 * gnode is a cross-platform (gjs/nodejs)
 * module loader for the desktop
 *
 */
;
(function (scope) {
    /**
     * define: amd style loader
     */
    Object.defineProperties(scope, {
        define: { value: (function (modules) {
                /**
                 * define a module
                 *
                 * @param name module name
                 * @param deps list of dependancies
                 * @param def  module definition
                 */
                return function (name, deps, def) {
                    if (typeof name === 'string') {
                        /**
                         * load a single amd module
                         */
                        modules[name] = { id: name, exports: {} };
                        var args = [
                            /**
                             * 1st arg is the require function
                             */
                            function (name) { return modules[name] ? modules[name].exports : imports[name]; },
                            /**
                             * 2nd arg is the exports object for the module
                             */
                            modules[name].exports
                        ];
                        /**
                         * for remaining args, get the list of dependencies
                         */
                        for (var i = 2; i < deps.length; i++)
                            args.push(modules[deps[i]].exports);
                        /**
                         * invoke the module definition
                         */
                        def.apply(modules[name].exports, args);
                    }
                    else {
                        /**
                         * load a hash of pre-loaded modules
                         * such as from browserify
                         */
                        var bundle = deps();
                        for (name in bundle)
                            modules[name] = { id: name, exports: bundle[name] };
                    }
                };
            }(typeof imports === 'undefined'
                ? require(DATADIR) /* node - load index.js */
                : (function () {
                    imports.searchPath.unshift(DATADIR);
                    return imports.modules.exports;
                }()))) }
    });
    Object.defineProperties(define, {
        amd: { value: true },
        version: { value: '0.2.0' },
    });
    if (typeof console === 'undefined') {
        /**
         * gjs: define a console object
         */
        Object.defineProperties(scope, {
            console: { value: {
                    log: function () { print.apply(null, arguments); },
                    warn: function () { print.apply(null, arguments); },
                    error: function () { print.apply(null, arguments); },
                    info: function () { print.apply(null, arguments); }
                } },
        });
    }
    else {
        /**
         * node: define global print functions
         */
        Object.defineProperties(scope, {
            print: { value: function () { console.log(arguments[0]); } },
            log: { value: function () { console.info(arguments[0]); } },
            logError: { value: function () { console.warn(arguments[0]); } },
            printerr: { value: function () { console.error(arguments[0]); } },
        });
    }
    /**
     * under gjs, the window object is udefined.
     * use global instead.
     */
})(typeof window === 'undefined' ? global : window);
