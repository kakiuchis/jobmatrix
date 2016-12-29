class LevelsController < ApplicationController
  before_action :set_field
  before_action :set_level, only: [:show, :edit, :update, :destroy]

  def index
    @levels = @field.levels.all
    @fields = Field.all
  end

  def show
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
        format.html { redirect_to field_levels_url, notice: 'Level was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @level.update(level_params)
        format.html { redirect_to field_levels_url, notice: 'Level was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @level.destroy
    respond_to do |format|
      format.html { redirect_to field_levels_url, notice: 'Level was successfully destroyed.' }
    end
  end

  private
    def set_field
      @field = Field.where(id: params[:field_id]).first
    end

    def set_level
      @level = @field.levels.where(id: params[:id]).first
    end

    def level_params
      params.require(:level).permit(:field_id, :height, :mintariff, :maxtariff, :name, :skill, :tool, :certificate)
    end
end
