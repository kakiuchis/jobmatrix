class LevelsController < ApplicationController
  before_action :authenticate_user!
  authorize_resource
  before_action :set_field
  before_action :set_level, only: [:edit, :update, :destroy]

  def index
    @levels = @field.levels.order("levelname_id")
    @fields = Field.all
  end

  def new
    @level = @field.levels.build
  end

  def edit
  end

  def create
    @level = @field.levels.build(level_params)

    respond_to do |format|
      if @level.save
        format.html { redirect_to field_levels_path, notice: 'レベルが作成されました。' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @level.update(level_params)
        format.html { redirect_to field_levels_path, notice: 'レベルが更新されました。' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @level.destroy
    respond_to do |format|
      format.html { redirect_to field_levels_path, notice: 'レベルが削除されました。' }
    end
  end

  private
    def set_field
      @field = Field.find(params[:field_id])
    end

    def set_level
      @level = @field.levels.find(params[:id])
    end

    def level_params
      params.require(:level).permit(:field_id, :height, :mintariff, :maxtariff, :name, :skill, :tool, :certificate, :levelname_id)
    end
end
