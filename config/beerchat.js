
module.exports = {
	"remotes": [{
		"name": "IRC",
		"type": "irc",
		"host": "chat.freenode.net",
		"username": "pandorabot",
		"password": process.env.BEERCHAT_IRC_PASSWORD,
		"debug": true,
		"system_channel": "main",
		"channels": {
			"main": "pandorabox",
			"fr": "pandorabox-fr",
		    	"de": "pandorabox-de",
			"es": "pandorabox-es",
			"mod": "pandorabox-mod",
			"lag": "pandorabox-lag",
			"bot": "pandorabox-bot",
			"events": "pandorabox-events",
			"offtopic": "pandorabox-offtopic"
		}
	},{
		"name": "Discord",
		"type": "discord",
		"debug": true,
		"token": process.env.BEERCHAT_DISCORD_TOKEN,
		"system_channel": "main",
		"channels": {
			"main": "main",
			"audit": "audit",
			"mod": "mod",
			"de": "de",
			"fr": "fr",
			"es": "es",
			"lag": "lag",
			"vote": "vote",
			"offtopic": "offtopic",
			"ru": "ru",
			"nsfw": "nsfw",
			"grounded": "grounded",
			"bot": "bot",
			"events": "events-chat"
		}
	}]
};
