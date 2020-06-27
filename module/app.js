var express = require('express');
var app = express();
var path = require("path");
var fs = require('fs');

env_path=''

try {
    if (fs.existsSync( __dirname +'/../dev.env')) {
        env_path='/../dev.env'
    } else if (fs.existsSync({path: __dirname +'/dev.env'})) {
        env_path='/dev.env'
    } else {
        console.log('dev.env not found')
    }
  } catch(err) {
    console.error(err)
}

require('dotenv').config({path: __dirname + env_path})

app.use(express.static(__dirname + '/view'));

app.post('/healthckeck', function (req, res) {
    res.json({ status: 200, message: "health", result: {} })
});

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