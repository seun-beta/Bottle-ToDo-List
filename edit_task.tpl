<p>Edit the task with ID = {{number}}</p>
<form action="">
    <input type="text" name="task" value="{{old[0]}}" size="100" maxlength="100" placeholder="input your edit">
    <select name="status" >
        <option >open</option>
        <option >closed</option>
    </select>
    <br>
    <input type="submit" name="save" value="save">
</form>