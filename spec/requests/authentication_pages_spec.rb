require 'spec_helper'

describe "AuthenticationPages" do
    subject {page}
    
describe "Authentication" do
    before { signin_page }
end

describe "signin" do
    before { visit signin_path }
    describe "With invalid information" do
      before { invalid_signin }
       
    end
    describe "With valid information" do
      let(:user) { FactoryGirl.create(:user) }
      before { valid_signin(user) }
      
    describe "followed by signout" do
      before {click_link "Sign Out"}
        it { should have_link('Sign In')}
      end
    end
  end
end


