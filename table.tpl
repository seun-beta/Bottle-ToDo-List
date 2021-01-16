%#template to generate a HTML table from a list of tuples (or list of lists, or tuple of tuples or ...)
<h1>To Do List</h1>

<table border="2">
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

<a href="/new">Add New Item</a><br>

<a href="/help">Help</a><br>