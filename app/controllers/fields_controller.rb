class FieldsController < ApplicationController
  before_action :set_field, only: [:edit, :update, :destroy]

  def index
    @fields = Field.all
  end

  def new
    @field = Field.new
  end

  def edit
  end

  def create
    @field = Field.new(field_params)

    respond_to do |format|
      if @field.save
        format.html { redirect_to fields_path, notice: '分野が作成されました。' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @field.update(field_params)
        format.html { redirect_to fields_path, notice: '分野が更新されました。' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @field.destroy
    respond_to do |format|
      format.html { redirect_to fields_path, notice: '分野が削除されました。' }
    end
  end

  private
    def set_field
      @field = Field.find(params[:id])
    end

    def field_params
      params.require(:field).permit(:name)
    end
end
