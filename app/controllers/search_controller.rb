class SearchController < ApplicationController
  def index
    render locals: {
      facade: StudentSearchFacade.new(params[:house])
    }
  end
end
