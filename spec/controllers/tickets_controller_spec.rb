require 'spec_helper'

describe TicketsController do

  let(:user) { create_user! }
  let(:project) { Project.create!(:name => "TestProject")}
  let(:ticket) { project.tickets.create!(:title => "Restrict Permissions", :description => "For the tickets controller")}
  
  context "standard users" do
    it "cannot access tickets of project they cannot access" do
      sign_in(:user, user)
      get :show, :id => ticket.id, :project_id => project.id
      response.should redirect_to(root_path)
      flash[:alert].should eql("The project you requested could not be found.")
    end
  end
end
