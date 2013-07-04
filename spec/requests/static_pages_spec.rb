require 'spec_helper'

describe "StaticPages" do
    #describe "GET /static_page"
  subject {page}
  #let(:base_title) { "Ruby on Rails Tutorial Sample App" }
 
    shared_examples_for "all static pages" do
    it { should have_selector('h1',    text: heading) }
    it { should have_selector('title', text: full_title(page_title)) }
  end

  describe "Home page" do
    before { visit root_path }
    let(:heading){'Sample Apps'}
    let(:page_title){''}
    it_should_behave_like "all static pages"
    it { should_not have_selector 'title', text: '| Home' }
  end
  
  describe "Help page" do
    before { visit help_path }
    let(:heading) {'Help'}
    let(:page_title){'Help'}
    it_should_behave_like "all static pages"
    #it { should have_selector('h1',    text: 'Help') }
    #it { should have_selector('title', text: full_title('Help')) }
  end
  
  describe "About page" do
   before { visit about_path }
    let(:heading){'About Us'}
    let(:page_title){'About Us'}
    it_should_behave_like "all static pages"
    #it {should have_selector('h1', text: 'About Us')}
    #it {should have_selector('title', text: full_title('About Us'))}
    #it {should_not have_selector('title', text: '| About Us')}
  end
  
  describe "Contact page" do
   before { visit contact_path }
    let(:heading){'Contact Us'}
    let(:page_title){'Contact Us'}
    it_should_behave_like "all static pages"
    #it {should have_selector('h1', text: 'Contact Us')}
    #it {should have_selector('title', text: full_title('Contact Us'))}
    #it {should_not have_selector('title', text: '| Contact Us')}
  end

 it "should have the right links on the layout" do
    visit root_path
    click_link "About"
    page.should have_selector 'title', text: full_title('About Us')
    click_link "Help"
    page.should have_selector 'title', text: full_title('Help')
    click_link "Contact"
    page.should have_selector 'title', text: full_title('Contact Us')
    click_link "Home"
    click_link "Sign up now!"
    page.should have_selector 'title', text: full_title('Sign Up')
    click_link "sample app"
    page.should_not have_selector 'title', text: full_title('Sample Apps')
end
end