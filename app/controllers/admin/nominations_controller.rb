class Admin::NominationsController < Admin::BaseController

  before_filter :load_nominee
  def index
    @committee = Committee.find(params[:committee_id])
    @application = @committee.applications.find_by_applicant_id(params[:nominee_id])
    @nominations = @committee.nominations.find_all_by_nominee_id(params[:nominee_id])
  
    @nominee = User.find(params[:nominee_id])

    render :index
  end

  def destroy
    @nominations.map(&:destroy)
    @application.try(:destroy)
    redirect_to admin_committee_path(@committee)
  end

  private
  def load_nominee
    @committee = Committee.find(params[:committee_id])
    @application = @committee.applications.find_by_applicant_id(params[:nominee_id])
    @nominations = @committee.nominations.find_all_by_nominee_id(params[:nominee_id])

  end
end
