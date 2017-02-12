class CompanyProfilesController < ApplicationController
  def new
    @company_profile = CompanyProfile.new
  end

  def create
    @company_profile = CompanyProfile.new(company_profile_params)
    @company_profile.userid = current_user.id
    if @company_profile.save then
      @msg = @company_profile.name + " has been added."
      create_logs(@msg)
      printf "Data saved"
      redirect_to :root
    else
      prinf "data not saved"
      redirect_to @company_profile
    end
  end

  def edit
    @company_profile = CompanyProfile.find(params[:id])
  end

  def update
    @company_profile = CompanyProfile.find(params[:id])
    @msg = @company_profile.name + " has been added."
    if @company_profile.update(company_profile_params)
      create_logs(@msg)
      redirect_to :root
    else
      redirect_to @company_profile
    end
  end

  def index
    @perpage = 2
    @company_id = CompanyProfile.where(userid: current_user.id)
    @company_id.ids.each do |f|
      @a = f
    end
    if @a.nil?
      @company_profile = nil
    else
      @company_profile = CompanyProfile.where(id: @a)
      @company_profile = @company_profile.paginate(:page => params[:page], :per_page => @perpage)
    end
    @page = params[:page] || 1
  end

  def destroy
    @company_profile = CompanyProfile.destroy(params[:id])
    if @company_profile.destroyed?
      redirect_to :root
    end
  end

  private

  def company_profile_params
    params.require(:company_profile).permit(:name, :address, :vdc_mun, :phone, :vat_pan_no, :logo, :district, :zone , :email, :website)
  end
end
