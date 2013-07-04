require 'spec_helper'

describe "StaticPages" do
    #describe "GET /static_page"
  subject {page}
  #let(:base_title) { "Ruby on Rails Tutorial Sample App" }
 
   describe "Home page" do
   
    before { visit root_path }

    it {should have_selector('h1', text: 'Sample Apps')}
    it {should have_selector('title', text: full_title(''))}
    it {should_not have_selector('title', text: '| Home')}
  end
  
  describe "Help page" do
    before { visit help_path }

    it { should have_selector('h1',    text: 'Help') }
    it { should have_selector('title', text: full_title('Help')) }
  end
  
  describe "About page" do
   before { visit about_path }
    it {should have_selector('h1', text: 'About Us')}
    it {should have_selector('title', text: full_title('About Us'))}
    #it {should_not have_selector('title', text: '| About Us')}
  end
  
  describe "Contact page" do
   before { visit contact_path }
  it {should have_selector('h1', text: 'Contact Us')}
    it {should have_selector('title', text: full_title('Contact Us'))}
    #it {should_not have_selector('title', text: '| Contact Us')}
  end
end