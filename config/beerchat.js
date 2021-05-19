
module.exports = {
	"remotes": [{
		"name": "IRC",
		"type": "irc",
		"host": "chat.freenode.net",
		"username": "pandorabot",
		"password": process.env.BEERCHAT_IRC_PASSWORD,
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
			"offtopic": "pandorabox-offtopic",
			"nsfw": "pandorabox-nsfw",
			"ideas": "pandorabox-ideas"
		}
	},{
		"name": "Libera",
		"type": "irc",
		"host": "irc.libera.chat",
		"username": "pandorabot",
		"password": process.env.BEERCHAT_LIBERA_PASSWORD,
		"system_channel": "main",
		"channels": {
			"main": "pandorabox",
			"mod": "pandorabox-mod",
			"offtopic": "pandorabox-offtopic"
		}
	},{
		"name": "Discord",
		"type": "discord",
		"token": process.env.BEERCHAT_DISCORD_TOKEN,
		"system_channel": "main",
		"channels": {
			"main": "main",
			"audit": "audit",
			"mod": "mod",
			"de": "de",
			"en": "en",
			"fr": "fr",
			"es": "es",
			"lag": "lag",
			"vote": "vote",
			"offtopic": "offtopic",
			"ru": "ru",
			"nsfw": "nsfw",
			"grounded": "grounded",
			"bot": "bot",
			"events": "events-chat",
			"ideas": "💡ideas"
		}
	}]
};
