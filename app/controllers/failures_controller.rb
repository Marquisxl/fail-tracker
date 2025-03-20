class FailuresController < ApplicationController
  before_action :authenticate_user!  # ログインユーザーのみアクセス可能
  before_action :set_failure, only: [:show, :edit, :update, :destroy]
  
  # 失敗記録の一覧表示
  def index
    @failures = current_user.failures.includes(:category).order(date: :desc)
  end
  
  # 失敗記録の詳細表示
  def show
    @perspective_analyses = @failure.perspective_analyses.includes(:perspective)
  end
  
  # 新規失敗記録フォーム
  def new
    @failure = current_user.failures.build
    @categories = Category.all
  end
  
  # 失敗記録の作成
  def create
    @failure = current_user.failures.build(failure_params)
    
    if @failure.save
      redirect_to @failure, notice: '失敗記録が作成されました。'
    else
      @categories = Category.all
      render :new, status: :unprocessable_entity
    end
  end
  
  # 失敗記録編集フォーム
  def edit
    @categories = Category.all
  end
  
  # 失敗記録の更新
  def update
    if @failure.update(failure_params)
      redirect_to @failure, notice: '失敗記録が更新されました。'
    else
      @categories = Category.all
      render :edit, status: :unprocessable_entity
    end
  end
  
  # 失敗記録の削除
  def destroy
    @failure.destroy
    redirect_to failures_path, notice: '失敗記録が削除されました。'
  end
  
  private
  
  # 特定の失敗記録を取得
  def set_failure
    @failure = current_user.failures.find(params[:id])
  end
  
  # 許可するパラメータ
  def failure_params
    params.require(:failure).permit(:title, :description, :date, :lessons_learned, :category_id)
  end
end 