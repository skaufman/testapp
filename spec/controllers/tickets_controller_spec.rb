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
    
    context "with permission to view the project" do
      before(:each) do
        sign_in(:user, user)
        Permission.create!(:user => user, :thing => project, :action => "view")
      end
      
      def cannot_create_tickets!
        response.should redirect_to(project)
        flash[:alert].should eql("You are not allowed to create tickets for this project.")
      end
      
      def cannot_update_tickets!
        response.should redirect_to(project)
        flash[:alert].should eql("You are not allowed to edit tickets for this project.")
      end

      it "cannot get new for a ticket without perms" do
        get :new, :project_id => project.id
        cannot_create_tickets!
      end
      
      it "cannot create a ticket without perms" do
        post :create, :project_id => project.id
        cannot_create_tickets!
      end
      
      it "cannot edit a ticket without perms" do
        get :edit, :id => ticket.id, :project_id => project.id
        cannot_update_tickets!
      end
      
      it "cannot update a ticket without perms" do
        put :update, :id => ticket.id, :project_id => project.id
        cannot_update_tickets!
      end
      
      it "cannot delete a ticket without perms" do
        delete :destroy, :id => ticket.id, :project_id => project.id
        response.should redirect_to(project)
        flash[:alert].should eql("You are not allowed to delete tickets for this project.")
      end
    end
    
  end
end
