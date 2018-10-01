(function(){

	var enable_maintenance = false;

	var Maintenance = m("div", {class:"col-md-12"}, m("div", {class:"alert alert-danger"},
		m("h3", "Maintenance window"),
		m("h4", "There will be a maintenance window on 2018-09-17 06:00 UTC for 2 hours"),
		m("h4", "The server will be available again afterwards")
	));

	var MapHref = "map/#-1782.25/493.5/10";

	var ServerStatsButton = m("a", {class: "btn btn-secondary btn-block", href:"grafana/d/cACE6ppik/overview?refresh=5s&orgId=1"}, "Server status");
	var ForumButton = m("a", {class:"btn btn-primary btn-block",href:"https://forum.minetest.net/viewtopic.php?f=10&t=20311"}, "Forum");
	var HighscoreButton = m("a", {class:"btn btn-primary btn-block",href:"highscore"}, "Highscore");
	var MapButton = m("a", {class:"btn btn-primary btn-block",href:MapHref}, "Realtime Map");
	var GithubButton = m("a", {class: "btn btn-secondary btn-block", href:"https://github.com/pandorabox-io/pandorabox.io"}, "Github/Issues");

	var AdminMailButton = m("a", {class: "btn btn-secondary btn-block", href:"mailto:admin@pandorabox.io"}, "Mail to admin");

	var MapIframe = m("iframe", {src:MapHref, width:"100%", height:"450px", style:"border: 0px solid"});

	var Intro = m("div", {class:"card"}, [
		m("div", {class:"card-body"}, [
			m("h3", "Pandorabox minetest server"),
			m("p", "Trains, currency, monsters, space, moon, spaceships and more..."),
			m("p", ["Download ", m("a", {href:"https://www.minetest.net/downloads/"}, "Minetest"), " and enter the following Server address:"]),
			m("p", "Server: ", m("b", "pandorabox.io")),
			m("p", "Port: ", m("b", "30000")),
			ForumButton,
			HighscoreButton,
			MapButton,
			GithubButton,
			AdminMailButton,
			ServerStatsButton
		])
	]);

	var MapRow = m("div", {class:"row"}, [
		m("div", {class:"col-md-6"}, Intro),
		m("div", {class:"col-md-6"}, MapIframe)
	]);

	var Nav = m("nav", {class:"navbar navbar-expand-lg navbar-dark bg-primary fixed-top"}, m("a", {class:"navbar-brand", href:"#"}, "Pandorabox"));

	var Screenshots = m("div", {class:"col-md-12"}, [
		m("div", {class:"card"}, [
			m("div", {class:"card-body"}, [
				m("h4", "Screenshots"),
				m("img", {src:"img/screenshot_20180615_181459.png"}),
				m("img", {src:"img/screenshot_20180615_181414.png"}),
				m("img", {src:"img/screenshot_20180615_181421.png"}),
				m("img", {src:"img/screenshot_20180615_181441.png"}),
				m("img", {src:"img/screenshot_20180615_181519.png"}),
				m("img", {src:"img/screenshot_20180615_181728.png"}),
				m("img", {src:"img/screenshot_20180615_182026.png"}),
			])
		])
	]);


	m.render(document.getElementById("app"), [
		Nav,
		m("br"), m("br"), m("br"), m("br"),
		enable_maintenance ? Maintenance : null,
		MapRow,
		m("br"), m("br"),
		m("div", {class:"row"}, Screenshots)
	]);


})();
