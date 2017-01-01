class ProjectsController < ApplicationController
  before_action :authenticate_user!
  authorize_resource
  before_action :set_field_level
  before_action :set_project, only: [:edit, :update, :destroy]

  def index
    @projects = @level.projects.order("updated_at DESC")
  end

  def new
    @project = @level.projects.build
  end

  def edit
  end

  def create
    @project = @level.projects.build(project_params)

    respond_to do |format|
      if @project.save
        format.html { redirect_to field_level_projects_path, notice: '案件が追加されました。' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to field_level_projects_path, notice: '案件が更新されました。' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to field_level_projects_path, notice: '案件が削除されました。' }
    end
  end

  private
    def set_field_level
      @field = Field.find(params[:field_id])
      @level = @field.levels.find(params[:level_id])
    end

    def set_project
      @project = @level.projects.find(params[:id])
    end

    def project_params
      params.require(:project).permit(:level_id, :content)
    end
end
