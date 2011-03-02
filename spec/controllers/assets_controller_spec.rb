require 'spec_helper'

describe AssetsController do
  let(:project) { Factory(:project) }
  let(:good_user) { create_user! }
  let(:bad_user) { create_user! }
  let(:ticket) { Factory(:ticket, :project => project) }
  let(:path) {Rails.root + "spec/fixtures/speed.txt"}
  let(:asset) {ticket.assets.create(:asset => File.open(path))}
  
  before do
    good_user.permissions.create!(:action => "view", :thing => project)
  end
  
  context "user with access" do
    before do
      sign_in(:user, good_user)
    end
    
    it "can access assets in project" do
      get "show", :id => asset.id
      response.body.should eql(File.read(path))
    end
  end
  
  context "user without access" do
    before do
      sign_in(:user, bad_user)
    end
    
    it "cannot access assets in project" do
      get "show", :id => asset.id
      response.should redirect_to(root_path)
      flash[:alert].should eql("The asset you requested cannot be found.")
    end
  end
end
