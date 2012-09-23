require 'spec_helper'

describe OrganizationsController do

  describe "#new" do
    it "assigns a new Organization to @organization" do
      get(:new)
      assigns(:organization).should be_new_record
    end
  end

  describe "#create" do
    context "when given valid parameters" do
      it "redirects to the organization" do
       post(:create)
       response.should redirect_to organization_path(assigns(:organization))
      end
     end

    context "when given invalid parameters" do
      before :each do
        Organization.any_instance.stub(:save).and_return(false)
        post(:create)
      end

      it "renders new" do
        response.should render_template('new')
      end

      it "does not save the organization" do
        assigns(:organization).should be_new_record
      end
    end
  end

end
