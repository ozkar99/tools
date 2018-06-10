class TodosController < ApplicationController
  def index
    @q = current_user.todos.ransack(params[:q])
    @todos = @q.result
  end

  def create
  end

  def destroy
  end

  private
    def categories(todos)
      return [] if todos.empty?
      todos.map {|t| t.category }.uniq.sort
    end
end
