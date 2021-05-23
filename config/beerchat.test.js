
module.exports = {
	"remotes": [{
		"name": "Discord",
		"type": "discord",
		"token": process.env.BEERCHAT_DISCORD_TEST_TOKEN,
		"system_channel": "main",
		"channels": {
			"main": "pandorabox-test"
		}
	}]
};
