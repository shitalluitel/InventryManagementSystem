class CompanyProfilesController < ApplicationController
  add_breadcrumb "Home", :root_path
  add_breadcrumb "CompanyProfile", :company_profiles_path

  def new
    add_breadcrumb "New"
    @company_profile = CompanyProfile.new
  end

  def create
    @company_profile = CompanyProfile.new(company_profile_params)
    @company_profile.userid = current_user.id
    if @company_profile.save then
      @msg ="Added " + @company_profile.name
      create_logs(@msg)
      flash[:success] = @company_profile.name.capitalize + " company added."
      redirect_to :company_profiles
    else
      flash[:error] = "Unable to add " + @company_profile.name.capitalize + " company."
      redirect_to @company_profile
    end
  end

  def edit
    add_breadcrumb "Edit"
    @company_profile = CompanyProfile.find(params[:id])
  end

  def update
    @company_profile = CompanyProfile.find(params[:id])
    @msg ="Updated " + @company_profile.name
    if @company_profile.update(company_profile_params)
      create_logs(@msg)
      flash[:success] = @company_profile.name.capitalize + " company updated."
      redirect_to :company_profiles
    else
      flash[:error] = "Unable to update " + @company_profile.name.capitalize + " company."
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
      @msg ="Destroy " + @company_profile.name
      create_logs(@msg)
      flash[:success] = "Company Profile Deleted."
      redirect_to :company_profiles
    else
      flash[:error] = "Couldn't delete Company Profile."
      redirect_to :root
    end
  end

  private

  def company_profile_params
    params.require(:company_profile).permit(:name,:ward_no, :tax, :address, :vdc_mun, :phone, :vat_pan_no, :logo, :district, :zone , :email, :website)
  end
end
