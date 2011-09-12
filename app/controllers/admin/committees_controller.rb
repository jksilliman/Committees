class Admin::CommitteesController < Admin::BaseController  
  load_and_authorize_resource
  def index
    respond_with(@committee)
  end

  def new
    respond_with(@committee)
  end

  def create
    @committee.save
    respond_with(@committee)
  end

  def edit
    respond_with(@committee)
  end

  def update
    @committee.save
    respond_with(@committee)
  end

  def destroy
    @committee.destroy
    respond_with(@committee)
  end

  def show
    respond_with(@committee)
  end


end
