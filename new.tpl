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

form{
background-color:#ebebeb;
overflow:hidden;
font-family:sans-serif;
margin:auto;
display: flex;
  justify-content: center;
  align-items: center;
  box-sizing:border-box;
  padding:50px;
  border-radius:20px;

}

form div{
  margin:auto;
  width:300px;
  padding:15px;
}
form input{
    padding:5px;
    margin-bottom:20px;
    max-width:300px;     
    border-radius:5px;

}
 
 .btn{
     width:90px;
 background-color:#464646;
     color:white;
 }

 .btn:hover{
background-color:#2f2f2f;
 }
h1{
font-family:sans-serif;
text-align:center;
font-weight:bolder;
font-size:40px;
margin-bottom:0;
}
</style>
    <title>Document</title>
</head>
<body>
<h1>Add To-do</h1>

    <form action="">
    <div>   
    <label for="task">
            Task:
        </label><br>
        <input type="text" name="task" id="task" placeholder="input your task"><br>
        <label for="description">Description:</label><br>
        <textarea name="description"  cols="30" rows="10" placeholder="write your description here"></textarea><br>
        <input type="submit" name="save" value="save"  class="btn" ></div>
     
        
    </form>
</body>
</html>

