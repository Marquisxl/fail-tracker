class AnalysesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_failure
  before_action :set_analysis, only: [:edit, :update]
  
  def new
    if @failure.analysis.present?
      redirect_to edit_failure_analysis_path(@failure)
    else
      @analysis = @failure.build_analysis
    end
  end
  
  def create
    @analysis = @failure.build_analysis(analysis_params)
    
    if @analysis.save
      redirect_to @failure, notice: '分析が保存されました。'
    else
      render :new, status: :unprocessable_entity
    end
  end
  
  def edit
  end
  
  def update
    if @analysis.update(analysis_params)
      redirect_to @failure, notice: '分析が更新されました。'
    else
      render :edit, status: :unprocessable_entity
    end
  end
  
  private
  
  def set_failure
    @failure = current_user.failures.find(params[:failure_id])
  end
  
  def set_analysis
    @analysis = @failure.analysis
  end
  
  def analysis_params
    params.require(:analysis).permit(:internal_factors, :external_factors)
  end
end 