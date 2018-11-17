function login(callback)
{
  var url = 'http://localhost:8080/login';

  var serverRequest = new XMLHttpRequest();

  serverRequest.open("POST",url,true);
  serverRequest.setRequestHeader("Content-type", 'application/x-www-form-urlencoded');
  var parameters = 'email='+document.getElementById('email').value + '&psw='+document.getElementById('psw').value;
  serverRequest.onreadystatechange = function () 
  {
    if((serverRequest.status == 200 || serverRequest.status == 0) && serverRequest.readyState == 4)
    {
      var response = JSON.parse(serverRequest.responseText);
      if(response[0]!= null)
      {
        var urlRedirect = "http://localhost:8080/cliente";
        window.location.href = urlRedirect+"?"+parameters;        
        callback(response);
      }
      else
        alert("Usuário não existe ou senha incorreta!");
        
    }
  };
  serverRequest.send(parameters);
}

function loginCaller()
{
  var data;
  login( function (response) {
      data = response;
  });
  //alert("Reposta : " + data[0].CodCliente);
}

function cadCliente()
{
  var url = 'http://localhost:8080/login';
  var serverRequest = new XMLHttpRequest();
  serverRequest.onreadystatechange = function () 
  {
    if(this.readyState == 4 && this.status == 200)
    {
      alert('Cliente cadastrado com sucesso!');
    }
  };
}


//Processar login feito pela front page
function onLogin()
{
  var parameters = location.search.substring(1).split("&");
  var temp = parameters[0].split("=");
  login = unescape(temp[1]);
  temp = parameters[1].split("=");
  psw = unescape(temp[1]);
  document.getElementById("log").innerHTML = "Logado como : " + login;
}