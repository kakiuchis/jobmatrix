class LevelnamesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_levelname, only: [:edit, :update, :destroy]

  def index
    @levelnames = Levelname.all
  end

  def new
    @levelname = Levelname.new
  end

  def edit
  end

  def create
    @levelname = Levelname.new(levelname_params)

    respond_to do |format|
      if @levelname.save
        format.html { redirect_to levelnames_path, notice: 'レベルが作成されました。' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @levelname.update(levelname_params)
        format.html { redirect_to levelnames_path, notice: 'レベルが更新されました。' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @levelname.destroy
    respond_to do |format|
      format.html { redirect_to levelnames_path, notice: 'レベルが削除されました。' }
    end
  end

  private
    def set_levelname
      @levelname = Levelname.find(params[:id])
    end

    def levelname_params
      params.require(:levelname).permit(:code, :name)
    end
end
