class RubricsController < ApplicationController
  before_action :find_rubric, only: %i(show edit update destroy)
  def index
    if params[:rubric_id]
      @rubric = Rubric.find(params[:rubric_id])
      @rubrics = @rubric.rubrics.page(params[:page])
    else
      @rubrics = Rubric.without_rubric.page(params[:page])
    end
  end

  def new
    @rubric = Rubric.new(rubric_id: params[:rubric_id])
  end

  def create
    @rubric = Rubric.new(rubric_params)
    if @rubric.save
      flash[:created] = t('messages.rubrics.successful.created')
      redirect_to @rubric
    else
      render :new
    end
  end

  def update
    if @rubric.update(rubric_params)
      flash[:updated] = t('messages.rubrics.successful.updated')
      redirect_to @rubric
    else
      render :edit
    end
  end

  def destroy
    @rubric.destroy
    flash[:destroyed] = t('messages.rubrics.successful.destroyed')
    redirect_to rubrics_path
  end

  private

  def find_rubric
    @rubric = Rubric.find(params[:id])
  end

  def rubric_params
    params.require(:rubric).permit(:title, :content, :rubric_id)
  end
end
