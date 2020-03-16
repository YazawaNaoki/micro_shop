class Admins::LabelsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @labels = Label.all
  end

  def show
    @label = Label.find(params[:id])
  end

  def new
    @label = Label.new
  end

  def create
    @label = Label.new(label_params)
    if @label.save
      redirect_to admins_labels_path
    else
      render :new
    end
  end

  def edit
    @label = Label.find(params[:id])
  end

  def update
    @label = Label.find(params[:id])
    if @label.update(label_params)
      redirect_to admins_label_path(label)
    else
      render :edit
    end
  end

  private
  def label_params
    params.require(:label).permit(:name)
  end
end
