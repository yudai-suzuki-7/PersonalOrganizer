class TodosController < ApplicationController
  before_action :authenticate_user!
  before_action :check_todo

  def index
    @todo = Todo.new
    @todos = Todo.where(user_id: current_user).rank(:row_order)
  end

  def sort
    todo = Todo.find(params[:todo_id])
    todo.update(todo_params)
    render body: nil
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
    params.require(:todo).permit(:user_id, :todo_text, :todo_status, :row_order_position)
  end

  def check_todo
    if current_user.todo_status == "notuse1"
      redirect_to events_path
    else
    end
  end

end
