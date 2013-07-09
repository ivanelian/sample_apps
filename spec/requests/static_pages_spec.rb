require 'spec_helper'
include ActionView::Helpers::TextHelper

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

    describe "for signed-in users" do
      let(:user) { FactoryGirl.create(:user) }
      before do
        FactoryGirl.create(:micropost, user: user, content: "Lorem ipsum")
        FactoryGirl.create(:micropost, user: user, content: "Dolor sit amet")
        valid_signin user
        visit root_path
      end
      
      describe "pagination" do
        it "should paginate the feed" do
          30.times { FactoryGirl.create(:micropost, user: user, content: "Consectetur adipiscing elit") }
          visit root_path
          page.should have_selector("div.pagination")
        end
      end

      it "should render the user's feed" do
        user.feed.each do |item|
          page.should have_selector("li##{item.id}", text: item.content)
        end
        page.should have_selector("section h1", text: user.name)
        page.should have_selector("section span", text: pluralize(Micropost.count.to_s, "micropost"))
      end

      describe "follower/following counts" do
        let(:other_user) { FactoryGirl.create(:user) }
        before do
          other_user.follow!(user)
          visit root_path
        end

        it { should have_link("0 following", href: following_user_path(user)) }
        it { should have_link("1 followers", href: followers_user_path(user)) }
      end
    end
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