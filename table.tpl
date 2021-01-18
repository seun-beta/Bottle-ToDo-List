%#template to generate a HTML table from a list of tuples (or list of lists, or tuple of tuples or ...)

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
html{
font-family:sans-serif;
min-height:100vh;
display: flex;
  justify-content: center;
  align-items: center;
}

h1{
font-family:sans-serif;
text-align:center;
font-weight:bolder;
font-size:40px;
margin-bottom:0;
}
  table {
        border-collapse: separate;
        border-spacing: 0 15px;
        border:none;
        font-family:sans-serif;

      }

td,th {
  text-align: left;
  padding: 15px;
  border:none;

}

td{
    border:2px solid white;

}
th{
  background-color:grey;

}

tr{
margin-top:10px;
height:30px;
background-color:#ebebeb;
}

a{
  text-decoration:none;
  color:black;
  font-size:17px;
}


td a:hover{
    text-decoration: underline;
transform:scale(1.2);
}

.addNew{
 background-color:#8e8e8e;
  border-radius:10pc;
  color: white;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  cursor: pointer;
}
.addNew:hover{
background-color:#5f5f5f;
}
.help{
 background-color:#464646;
  border-radius:10pc;
  color: white;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  cursor: pointer;
}
.help:hover{
background-color:#2f2f2f;
}
</style>
    </head>
<h1>To Do List</h1>

<table border="2">
 <tr>
    <th>ID</th>
    <th>Task</th>
    <th>Description</th>
  </tr>
  %for row in rows:
 
  <tr>
  %for col in row:
    <td>
      <a href="/edit">{{col}}</a>
    </td>
  %end
  </tr>
%end
</table>

<div><a href="/new" class="addNew">Add New Item</a>
</div>
<div><a href="/help" class="help">Help</a>
</div>


</html>
