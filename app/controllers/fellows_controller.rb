class FellowsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :find_fellow, :only => [:show,
                                       :edit,
                                       :update,
                                       :destroy]
  def index
    @fellows = Fellow.all
  end

  def new
    @fellow = Fellow.new
  end

  def create
    @fellow = Fellow.new(params[:fellow])
    if @fellow.save
      flash[:notice] = "Fellow has been added."
      redirect_to @fellow
    else
      flash[:alert] = "Fellow has not been added."
      render action: "new"
    end
  end

  def show
    @fellow = Fellow.find(params[:id])
  end

  def edit
    @fellow = Fellow.find(params[:id])
  end

  def update
    @fellow = Fellow.find(params[:id])
    if @fellow.update_attributes(params[:fellow])
      flash[:notice] = "Fellow has been updated."
      redirect_to @fellow
    else
      flash[:alert] = "Fellow has not been updated."
      render action: "edit"
    end
  end

  def destroy
    @fellow = Fellow.find(params[:id])
    @fellow.destroy
    flash[:notice] = "Fellow has been deleted."
    redirect_to fellows_path
  end

private
  def find_fellow
    @fellow = Fellow.find(params[:id])
    rescue ActiveRecord::RecordNotFound
    flash[:alert] = "The fellow you were looking for could not be found."
    redirect_to fellows_path
  end
end
