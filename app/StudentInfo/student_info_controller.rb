require 'rho/rhocontroller'
require 'helpers/browser_helper'

class StudentInfoController < Rho::RhoController
  include BrowserHelper

  # GET /StudentInfo
  def index
    @studentinfos = StudentInfo.find(:all)
    render :back => '/app'
  end

  # GET /StudentInfo/{1}
  def show
    @studentinfo = StudentInfo.find(@params['id'])
    if @studentinfo
      render :action => :show, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # GET /StudentInfo/new
  def new
    @studentinfo = StudentInfo.new
    render :action => :new, :back => url_for(:action => :index)
  end

  # GET /StudentInfo/{1}/edit
  def edit
    @studentinfo = StudentInfo.find(@params['id'])
    if @studentinfo
      render :action => :edit, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # POST /StudentInfo/create
  def create
    @studentinfo = StudentInfo.create(@params['studentinfo'])
    redirect :action => :index
  end

  # POST /StudentInfo/{1}/update
  def update
    @studentinfo = StudentInfo.find(@params['id'])
    @studentinfo.update_attributes(@params['studentinfo']) if @studentinfo
    redirect :action => :index
  end

  # POST /StudentInfo/{1}/delete
  def delete
    @studentinfo = StudentInfo.find(@params['id'])
    @studentinfo.destroy if @studentinfo
    redirect :action => :index  
  end
end
