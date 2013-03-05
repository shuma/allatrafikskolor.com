class SchoolsController < ApplicationController
  # show method

  def show
    @school = School.find(params[:id])
  end

  # Index
  def index
    @schools = School.search(params)
  end

end
