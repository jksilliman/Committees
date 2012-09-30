class CommitteesController < ApplicationController
  
  def index
    if params[:section_id]
      @section = Section.find(params[:section_id])
      @committees =  Committee.find_all_by_section_id(params[:section_id])
    elsif params[:section_type] == "open"
      @section = Section.new(name: "Open for Applications")
      @committees = Committee.find_all_by_applications_open(true)
    else
      @section = Section.new(name: "Other")
      @committees = Committee.find_all_by_section_id(nil)      
    end
  end
  def show
    @committee = Committee.find(params[:id])
  end

end
