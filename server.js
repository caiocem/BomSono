const express = require('express');
var bodyParser = require('body-parser');
var app = express();
var fs = require('fs');
var db = require('./app/db_connection.js');
var http = require('http');
var server = http.createServer(app);

var urlIndex = 'BomSonoFrontPage.html';

app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());

app.get('/', function (req, res) {
 /*  fs.readFile(urlIndex, function(err, data) {
    res.writeHead(200, {'Content-Type': 'text/html'});
    res.write(data);
    res.end();
  }); */
  res.statusCode = 200;
  res.end('OK');  
});

app.post('/', function(req, res) {
  console.log(req.body);
  res.statusCode = 200;
  res.send(200);
});

app.post('/cadCliente', function(req, res) {
  //console.log(req.body);
  

  res.end(200);
});

app.post('/login', function(req,res){
  /* const email = req.email;
  const senha = req.senha;
  db.execQuery('SELECT * FROM CLIENTES WHERE email ='+email+' senha = '+senha, res); */
  console.log(req.body.email);
  console.log(req.body.senha);
  console.log("CERTO");
  res.statusCode = 200;
  res.end('OK');  
});

app.post('/buscaApt', function(req, res) {
  const tv = req.body.tv != null;
  const frigobar= req.body.frigobar != null;
  const arCond = req.body.arcond != null;
  const Nesp = req.body.NecEsp != null;
  const npessoas = req.body.Npessoas;
  const dataChegada = req.body.dataChegada;
  const dataSaida = req.body.dataSaida;
  const ncamas_casal = req.body.Ncamas_casal;
  const ncamas_solteiro = req.body.Ncamas_solteiro;
  if(ncamas_casal == null) ncamas_casal = 0;
  if(ncamas_solteiro == null) ncamas_solteiro = 0;
  //realizar uma consulta e retornar resultado
  res.end();
});

server.listen(8080);
