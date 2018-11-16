
function login()
{
  var url = 'http://localhost:8080/login';

  var serverRequest = new XMLHttpRequest();

  serverRequest.open("POST",url,true);
  serverRequest.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
  var parameters = 'email='+document.getElementById('email').innerHTML + '&senha='+document.getElementById('psw').innerHTML;
  serverRequest.onreadystatechange = function () 
  {
    if(this.readyState == 4 && (this.status == 200 || this.status == 0))
    {
      alert("OK!");
    }
  };
  serverRequest.send(parameters);

}

function cadCliente()
{
  var serverRequest = new XMLHttpRequest();
  serverRequest.onreadystatechange = function () 
  {
    if(this.readyState == 4 && this.status == 200)
    {
      alert('Cliente cadastrado com sucesso!');
    }
  };
}


