class TodosController < ApplicationController
  def index
    @todo = Todo.new
    @todos = Todo.where(user_id: current_user)
  end

  def create
    @todo = Todo.new(todo_params)
    @todo.user_id = current_user.id
    if @todo.save
      redirect_to todos_path
    else
      render action: :index
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
    redirect_to action: :index, notice:"削除しました"
  end

  def update
    @todo = Todo.find(params[:id])
    if @todo.update(todo_params)
      redirect_to action: :index, notice:"編集しました"
    else
      render action: :edit
    end
  end

  def check
    todo = Todo.find(params[:id])
    if todo.status == "undone"
      todo.status = "done"
    else
      todo.status = "undone"
    end
    todo.update(status: todo.status)
    redirect_to todos_path
  end

  private
  def todo_params
    params.require(:todo).permit(:user_id, :todo_text, :status)
  end

end
