require 'spec_helper'

describe ProjectsController do
  it "displays an error message when asked for a missing project" do
    get :show, :id => 'bogus'
    response.should redirect_to(projects_path)
    flash[:error].should eql("The project you requested could not be found.")
  end
end
