/**
 * Gulp Configuration
 *
 * A set of paths and options for Gulp to properly build our application.
 */

// Define Global Variables for our main object
var dest = './project/public/';
var src = './project/dev/';

module.exports = {
    // Define module variables for easy access to source and destination dirs
    src: src,
    dest: dest,

    // BrowserSync allows us to have livereload as we work on files
    browserSync: {
        mode: 'proxy',
        all: {
            port: process.env.PORT || 8000,
            open: true
        },
        debug: {
            logFileChanges: true,
            logLevel: "debug"
        },
        serverOptions: {
            files: [
                dest + "/**",
                "!" + dest + "/**.map"
            ],
        },
        proxyOptions: {
            proxy: '127.0.0.1:8000'
        }
    },

    // Compile our SCSS files
    sass: {
        src: [
            src + 'scss/screen.scss',
            src + 'scss/**/*.scss'
        ],
        dest: dest + 'css',
        settings: {}
    },

    // Compile our Coffee files
    coffee: {
        src: [
            src + 'coffee/app.coffee',
            src + 'coffee/**/*.coffee'
        ],
        dest: src + 'js',
        settings: {
            bare: true
        }
    },

    // Minimize Images
    images: {
        src: src + 'img',
        dest: dest + 'img',
        processImages: /\.(gif|jpg|jpeg|tiff|png)$/i,
        imageminOptions: {
            progressive: true,
            svgoPlugins: [{removeViewBox: false}],
            optimizationLevel: 1
        }
    },

    // Handle minimizing JS Files into a single file
    browserify: {
        extensions: [],
        transform: [],
        bundleConfigs: [
            {
              entries: src + '/js/app.js',
              dest: dest + '/js',
              outputName: 'app.js'
            }
        ]
    },

    // Django Templates
    templates: {
        src: [
            src + '../apps/*/templates/*.html',
            src + '../apps/*/templates/**/*.html',
            src + '../templates/*.html'
        ]
    },

    // Third-Party
    third_party: {
        dest: {
            js: dest + 'js',
            css: dest + 'css',
            fonts: dest + 'fonts'
        },
        js: [
            'node_modules/jquery/dist/jquery.min.js',
            'node_modules/retina.js/src/retina.js',
            'node_modules/bootstrap/dist/js/bootstrap.min.js',
            'node_modules/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js'
        ],
        css: [
            'node_modules/bootstrap/dist/css/bootstrap.min.css',
            'node_modules/font-awesome/css/font-awesome.min.css'
        ],
        fonts: [
            'node_modules/bootstrap/dist/fonts/glyphicons-halflings-regular.eot',
            'node_modules/bootstrap/dist/fonts/glyphicons-halflings-regular.svg',
            'node_modules/bootstrap/dist/fonts/glyphicons-halflings-regular.ttf',
            'node_modules/bootstrap/dist/fonts/glyphicons-halflings-regular.woff',
            'node_modules/bootstrap/dist/fonts/glyphicons-halflings-regular.woff2',
            'node_modules/font-awesome/fonts/FontAwesome.otf',
            'node_modules/font-awesome/fonts/fontawesome-webfont.eot',
            'node_modules/font-awesome/fonts/fontawesome-webfont.svg',
            'node_modules/font-awesome/fonts/fontawesome-webfont.ttf',
            'node_modules/font-awesome/fonts/fontawesome-webfont.woff',
            'node_modules/font-awesome/fonts/fontawesome-webfont.woff2'
        ]
    }
}
