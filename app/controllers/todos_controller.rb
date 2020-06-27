class TodosController < ApplicationController
  def index
    @todo = Todo.new
    @todos = Todo.where(user_id: current_user)
  end

  def create
    @todo = Todo.new(todo_params)
    @todo.user_id = current_user.id
    if @todo.save
      redirect_to action: :index
    else
      redirect_to action: :index
    end
  end

  def edit
    @todo = Todo.find(params[:id])
  end

  def edit
    @todo = Todo.find(params[:id])
  end

  def destroy
    todo = Todo.find(params[:id])
    todo.destroy
    redirect_to action: :index
  end

  def update
    @todo = Todo.find(params[:id])
    if @todo.update(todo_params)
      redirect_to action: :index
    else
      render action: :edit
    end
  end

  def check
    todo = Todo.find(params[:id])
    if todo.todo_status == "undone"
      todo.todo_status = "done"
    else
      todo.todo_status = "undone"
    end
    todo.update(todo_status: todo.todo_status)
    redirect_to todos_path
  end

  private
  def todo_params
    params.require(:todo).permit(:user_id, :todo_text, :todo_status)
  end

end
