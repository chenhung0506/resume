var express = require('express');
var app = express();
var path = require("path");
// require('dotenv').config();
require('dotenv').config({path: __dirname + '/.env'})
app.use(express.static(__dirname + '/view'));

app.get('/', function (req, res) {
    res.sendFile(path.join(__dirname + '/view/index.html'));
});

app.get('/avalon', function (req, res) {
    res.sendFile(path.join(__dirname + '/view/avalon.html'));
});

app.get('/gridSnake', function (req, res) {
    res.sendFile(path.join(__dirname + '/view/gridSnake.html'));
});

app.get('/iVoting', function (req, res) {
    res.sendFile(path.join(__dirname + '/view/iVoting.html'));
});

app.get('/certificate', function (req, res) {
    res.sendFile(path.join(__dirname + '/view/certificate.html'));
});

app.listen(process.env["PORT"]);
console.log('app is listening at localhost: '+process.env["PORT"]);