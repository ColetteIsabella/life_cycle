class StatusesController < ApplicationController

  before_filter :find_status, :only => [:show, :edit, :update, :destroy]
  def index
    @statuses = Status.all
  end

  def new
    @status = Status.new
  end

  def create
    @status = Status.new(params[:status])
    if @status.save
      flash[:notice] = "Status has been created."
      redirect_to @status
    else
      flash[:alert] = "Status has not been created."
      render action: "new"
    end
  end

  def show
  end

  def edit
  end

  def update
    @status.update_attributes(params[:status])
    flash[:notice] = "Status has been updated."
    redirect_to @status
  end

  def destroy
    @status.destroy
    flash[:notice] = "Status has been deleted."
    redirect_to statuses_path
  end

  private
  def find_status
    @status = Status.find(params[:id])
    rescue ActiveRecord::RecordNotFound
    flash[:alert] = "The status you were looking" +
                    " for could not be found."
    redirect_to statuses_path
  end
end
