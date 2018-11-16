module.exports =
{
  testConnection : function ()
  {
    const mysql      = require('mysql');
    const connection = mysql.createConnection({
      host     : 'localhost',
      port     : 3306,
      user     : 'root',
      password : 'toor',
      database : 'BomSono'
    });

    connection.connect(function(err){
      if(err) return console.log(err);
      console.log('conectou!');
    })
  },
  
  execQuery : function execQuery(sqlQry,res)
  {
    const mysql      = require('mysql');
    const connection = mysql.createConnection({
      host     : 'localhost',
      port     : 3306,
      user     : 'root',
      password : 'toor',
      database : 'BomSono'
    });

    connection.query(sqlQry, function(error, results, fields)
    {
      if(error) 
        res.json(error);
      else
        res.json(results);
      connection.end();
    });
  }
}
  

  