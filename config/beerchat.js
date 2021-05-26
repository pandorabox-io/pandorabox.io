
module.exports = {
	"remotes": [{
		"name": "IRC",
		"type": "irc",
		"host": "irc.libera.chat",
		"username": "pandorabot",
		"password": process.env.BEERCHAT_LIBERA_PASSWORD,
		"system_channel": "main",
		"channels": {
			"main": "pandorabox",
			"mod": "pandorabox-mod",
			"offtopic": "pandorabox-offtopic",
			"fr": "pandorabox-fr",
			"de": "pandorabox-de",
			"es": "pandorabox-es",
			"lag": "pandorabox-lag",
			"bot": "pandorabox-bot",
			"events": "pandorabox-events",
			"nsfw": "pandorabox-nsfw",
			"ideas": "pandorabox-ideas"
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
