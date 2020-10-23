$("#todo_<%= @todo.position %>").replaceWith('<%=j render "todo_list", tood: @todo %>')
$("#todo_<%= @target.position %>").replaceWith('<%=j render "todo_list", todo: @target %>')