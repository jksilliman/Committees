class NominationsController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource
  
  respond_to :html
  

  def new
    @committee = Committee.find(params[:committee_id])
    @nomination.committee_id = @committee.id
    @nomination.nominator = current_user
    respond_with(@nomination) 
  end

  def create
    @committee = @nomination.committee
    @nomination.nominator = current_user
    @nomination.save
    respond_with(@nomination, :location => root_url)
  end

end
