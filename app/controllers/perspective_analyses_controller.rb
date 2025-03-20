class PerspectiveAnalysesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_failure
  
  def new
    # ランダムに偉人を選択（まだ分析していない偉人から）
    used_perspective_ids = @failure.perspective_analyses.pluck(:perspective_id)
    available_perspectives = Perspective.where.not(id: used_perspective_ids)
    
    if available_perspectives.empty?
      redirect_to @failure, notice: 'すべての偉人の視点から分析済みです。'
      return
    end
    
    @perspective = available_perspectives.order("RANDOM()").first
    @perspective_analysis = @failure.perspective_analyses.build(perspective: @perspective)
  end
  
  def create
    @perspective_analysis = @failure.perspective_analyses.build(perspective_analysis_params)
    
    if @perspective_analysis.save
      redirect_to @failure, notice: '偉人の視点からの分析が保存されました。'
    else
      @perspective = @perspective_analysis.perspective
      render :new, status: :unprocessable_entity
    end
  end
  
  private
  
  def set_failure
    @failure = current_user.failures.find(params[:failure_id])
  end
  
  def perspective_analysis_params
    params.require(:perspective_analysis).permit(:content, :perspective_id)
  end
end 