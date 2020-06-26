var express = require('express');
var app = express();
var path = require("path");

app.use(express.static(__dirname + '/view'));
app.get('/', function (req, res) {
    res.sendFile(path.join(__dirname + '/view/index.html'));
});

app.listen(3000);
console.log('app is listening at localhost:3000...');