
const bodyParser = require('body-parser');
const express = require('express');
const app = express();
const port = 8080
const fs = require('fs');
const db = require('./app/db_connection.js');

var index = 'BomSonoFrontPage.html';
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));


const router = express.Router();

router.get('/', (req, res) => {
  fs.readFile(index, function(err, data) {
    res.writeHead(200, {'Content-Type': 'text/html'});
    res.write(data);
    res.end();
  });
});
router.post('/', (req, res) => res.json({ message: 'Funcionando!' }));


router.get('/app/client.js',(req,res) =>{
  var JS_Script = "app/client.js";
  fs.readFile(JS_Script, function(err, data) {
    res.writeHead(200, {'Content-Type':'application/javascript'});
    res.write(data);
    res.end();
  });
});

router.get('/cliente',(req,res)=>{
  var url = 'BomSonoPageClienteLogado.html';
  fs.readFile(url, function(err, data) {
    res.writeHead(200, {'Content-Type': 'text/html'});
    res.write(data);
    res.end();
  });
});



router.post('/login',(req,res) =>
{
  var email = req.body.email;
  var senha = req.body.psw;
  console.log(email);
  console.log(senha);
  var filter = " WHERE email='"+email +"' AND senha='"+senha+"'";
  //res.json({"CodCliente" : "teste"});
  db.execQuery("SELECT * FROM Cliente"+filter,res);
});

router.post('/buscaApt',(req,res)=>{
  const tv = req.body.tv != null;
  const frigobar= req.body.frigobar != null;
  const arCond = req.body.arcond != null;
  const Nesp = req.body.NecEsp != null;
  const npessoas = req.body.Npessoas;
  const dataChegada = req.body.dataChegada;
  const dataSaida = req.body.dataSaida;
  var ncamas_casal = req.body.Ncamas_casal;
  var ncamas_solteiro = req.body.Ncamas_solteiro;
  if(ncamas_casal == null) ncamas_casal = 0;
  if(ncamas_solteiro == null) ncamas_solteiro = 0;

  var filter = "WHERE TV="+tv + " AND Ar="+arCond+" AND frigobar ="+frigobar;
  filter += " AND CodApt in (SELECT idTipo FROM Tipo WHERE CamasCasal ="+ncamas_casal + " AND CasmasSolteiro ="+ncamas_solteiro;
  filter += " AND NecEspeciais ="+Nesp +")";
  db.execQuery("SELECT * FROM Apartamento "+filter + " ORDER BY Diaria",res);
});

router.post('/cadCliente',(req,res) => 
{
  res.send("OK");
  res.end();
});
app.use('/', router);
app.listen(port);
