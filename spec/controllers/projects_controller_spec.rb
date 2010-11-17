require 'spec_helper'

describe ProjectsController do
  
  let(:user) { create_user! }
  let(:project) { Project.create!(:name => "TestProject") }
  
  it "displays an error message when asked for a missing project" do
    get :show, :id => 'bogus'
    response.should redirect_to(projects_path)
    flash[:error].should eql("The project you requested could not be found.")
  end
  
  describe "standard users" do
    {"new" => "get", "create" => "post", "edit" => "get", "update" => "put", "destroy" => "delete"}.each do |action, method|
      it "cannot access the new action" do
        sign_in(:user, user)
        send(method, action.dup, :id => project.id)
        response.should redirect_to(root_path)
        flash[:alert].should eql("You must be an admin to do that.")
      end      
    end
  end
  
end
