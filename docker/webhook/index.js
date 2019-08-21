const express = require('express')
const bodyParser = require('body-parser')
const jsonParser = bodyParser.json()

const app = express();
app.use(express.static('public'));
app.disable('etag');

app.post('/', jsonParser, function(req, res){
	// req.body = {}
	console.log(req.body);
	res.end();
});

process.on("SIGTERM", () => process.exit(1))
process.on("SIGINT", () => process.exit(1))

app.listen(8080, () => console.log('Listening on http://127.0.0.1:8080'));
