require 'rho/rhocontroller'
require 'helpers/browser_helper'

class TutorInfoController < Rho::RhoController
  include BrowserHelper

  # GET /TutorInfo
  def index
    @tutorinfos = TutorInfo.find(:all)
    render :back => '/app'
  end

  # GET /TutorInfo/{1}
  def show
    @tutorinfo = TutorInfo.find(@params['id'])
    if @tutorinfo
      render :action => :show, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # GET /TutorInfo/new
  def new
    @tutorinfo = TutorInfo.new
    render :action => :new, :back => url_for(:action => :index)
  end

  # GET /TutorInfo/{1}/edit
  def edit
    @tutorinfo = TutorInfo.find(@params['id'])
    if @tutorinfo
      render :action => :edit, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # POST /TutorInfo/create
  def create
    @tutorinfo = TutorInfo.create(@params['tutorinfo'])
    redirect :action => :index
  end

  # POST /TutorInfo/{1}/update
  def update
    @tutorinfo = TutorInfo.find(@params['id'])
    @tutorinfo.update_attributes(@params['tutorinfo']) if @tutorinfo
    redirect :action => :index
  end

  # POST /TutorInfo/{1}/delete
  def delete
    @tutorinfo = TutorInfo.find(@params['id'])
    @tutorinfo.destroy if @tutorinfo
    redirect :action => :index  
  end
end
