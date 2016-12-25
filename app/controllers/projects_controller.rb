class ProjectsController < ApplicationController
  before_action :set_field_level
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  def index
    @projects = @level.projects.all
  end

  def show
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
        format.html { redirect_to [@field, @level, @project], notice: 'Project was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to [@field, @level, @project], notice: 'Project was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to field_level_projects_url, notice: 'Project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_field_level
      # @field = Field.where(id: params[:field_id]).first
      # @level = @field.levels.where(id: params[:level_id]).first
      @level = Level.where(id: params[:level_id], field_id: params[:field_id] ).first
    end

    def set_project
      @project = @level.projects.where(id: params[:id]).first
    end

    def project_params
      params.require(:project).permit(:level_id, :content)
    end
end
