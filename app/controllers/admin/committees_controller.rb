class Admin::CommitteesController < ApplicationController
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

  protected
  def respond_with(*args, &block)
    super(:admin, *args, &block)
  end
end
