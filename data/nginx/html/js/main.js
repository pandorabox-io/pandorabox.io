(function(){

	var MapHref = "https://pandorabox.io/map/#-1782.25/493.5/10";

	var ForumButton = m("a", {class:"btn btn-primary btn-block",href:"https://pandorabox.io/forum"}, "Forum");

	var MapButton = m("a", {class:"btn btn-primary btn-block",href:MapHref}, "Open map");
	var MapIframe = m("iframe", {src:MapHref, width:"100%", height:"450px", style:"border: 0px solid"});

	var Intro = m("div", {class:"card"}, [
		m("div", {class:"card-body"}, [
			m("h3", "Pandorabox minetest server"),
			m("p", "Pandorabox minetest server"),
			ForumButton
		])
	]);

	var MapRow = m("div", {class:"row"}, [
		m("div", {class:"col-md-6"}, Intro),
		m("div", {class:"col-md-6"}, [MapButton, MapIframe])
	]);

	var Nav = m("nav", {class:"navbar navbar-expand-lg navbar-dark bg-primary fixed-top"}, m("a", {class:"navbar-brand", href:"#"}, "Pandorabox"));


	m.render(document.getElementById("app"), [
		Nav,
		m("br"), m("br"), m("br"), m("br"),
		MapRow
	]);


})();