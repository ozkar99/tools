class TodosController < ApplicationController
  def index
    @q = current_user.todos.ransack(params[:q])
    @todos = @q.result
  end

  def create
    @todo = current_user.todos.create(todo_params)
  end

  def destroy
    @todo = Todo.find(params[:id])
    @todo.destroy
  end

  private
    def todo_params
      params.require(:todo).permit(:description)
    end
end
