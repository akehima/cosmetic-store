class Admin::IntrosController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_required
  layout "admin"

  def index
    @intros = Intro.all
  end

  def new
    @intro = Intro.new
  end

  def create
    @intro = Intro.new(intro_params)

    if @intro.save
      redirect_to admin_intros_path, notice: 'Успешно добавить рекламу'
    else
      render :new
    end
  end

  def edit
    @intro = Intro.find(params[:id])
  end

  def update
    @intro = Intro.find(params[:id])
    @intro.update(intro_params)
    if @intro.save
      redirect_to admin_intros_path, notice: 'Успешно изменять рекламу'
    else
      render :edit
    end
  end

  def destroy
    @intro = Intro.find(params[:id])
    @intro.destroy
      redirect_to admin_intros_path, notice: 'Успешно удалить рекламу'
  end

  def publish
    @intro = Intro.find(params[:id])
    @intro.publish!
    redirect_to :back
  end

  def hide
    @intro = Intro.find(params[:id])
    @intro.hide!
    redirect_to :back
  end

private

  def intro_params
    params.require(:intro).permit(:title, :content, :link, :image, :is_hidden)
  end

end
