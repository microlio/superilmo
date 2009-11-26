require 'spec_helper'
 
describe User do
  before(:each) do
    @valid_attributes = {
      :username => "johndoee",
      :password => "secretret",
      :firstname => "John Doe",
      :lastname => "013333333"
 
    }
 
    @valid_user = User.new(@valid_attributes)
  end
 
  describe "creation" do
    it "should create a new instance given valid attributes" do
      User.create!(@valid_attributes)
    end
 
    #it "should lowercase username" do
    #   user = User.create!(@valid_attributes.merge({:username => "jOhNDoeE"}))
    #   user.username.should == "johndoee"
    #end
  end
 
  describe "validation" do
    it "should require username to be between 8 and 16 characters" do
      user = User.new(@valid_attributes)
      user.should be_valid
 
      user.username = "a"*7
      user.should_not be_valid
 
      user.username = "a"*17
      user.should_not be_valid
    end
 
    it "should have a password" do
      @valid_user.password = ""
      @valid_user.should have(1).errors_on(:password)
    end
 
    it "should require confirmation of password"
 
  end
 
end