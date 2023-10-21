/*
Pandorabox node-RED config
*/

module.exports = {
	uiPort: process.env.PORT || 1880,

	mqttReconnectTime: 15000,
	serialReconnectTime: 15000,

	adminAuth: require('node-red-auth-github')({
		clientID: "534c058bcbb188344cb5",
		clientSecret: process.env.GITHUB_CLIENT_SECRET,
		baseURL: "https://pandorabox.io/nodered/",
		default: {
			permissions: "read"
		},
		users: [{
			username: "BuckarooBanzay",
			permissions: ["*"]
		},{
			username: "OgelGames",
			permissions: ["*"]
		},{
			username: "S-S-X",
			permissions: ["*"]
		},{
			username: "SwissalpS",
			permissions: ["*"]
		},{
			username: "6r1d",
			permissions: ["*"]
		},{
			username: "FeXoR-o-Illuria",
			permissions: ["*"]
		}]
	}),

	// The maximum length, in characters, of any message sent to the debug sidebar tab
	debugMaxLength: 1000,

	httpAdminRoot: '/nodered',
	httpNodeRoot: '/nodered',

	// The following property can be used to seed Global Context with predefined
	// values. This allows extra node modules to be made available with the
	// Function node.
	// For example,
	//    functionGlobalContext: { os:require('os') }
	// can be accessed in a function block as:
	//    global.get("os")
	functionGlobalContext: {
		// os:require('os'),
		// jfive:require("johnny-five"),
		// j5board:require("johnny-five").Board({repl:false})
	},

	// `global.keys()` returns a list of all properties set in global context.
	// This allows them to be displayed in the Context Sidebar within the editor.
	// In some circumstances it is not desirable to expose them to the editor. The
	// following property can be used to hide any property set in `functionGlobalContext`
	// from being list by `global.keys()`.
	// By default, the property is set to false to avoid accidental exposure of
	// their values. Setting this to true will cause the keys to be listed.
	exportGlobalContextKeys: false,

	// Context Storage
	// The following property can be used to enable context storage. The configuration
	// provided here will enable file-based context that flushes to disk every 30 seconds.
	// Refer to the documentation for further options: https://nodered.org/docs/api/context/
	//
	contextStorage: {
		default: {
			module:"localfilesystem"
		},
	},

	// Configure the logging output
	logging: {
		console: {
			level: "info",
			metrics: false,
			audit: false
		}
	},

	editorTheme: {
        tours: false,
        projects: {
            enabled: true
        }
    }
};
