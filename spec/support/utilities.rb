#def full_title(page_title)
#  base_title = "Ruby on Rails Tutorial Sample App"
#  if page_title.empty?
#    base_title
#  else
#    "#{base_title} | #{page_title}"
#  end
#end

include ApplicationHelper

def valid_signin(user)
  fill_in "Email",    with: user.email
  fill_in "Password", with: user.password
  click_button "Sign In"
  
  it { should have_selector('title', text: user.name) }
  it { should have_link('Profile', href: user_path(user)) }
  it { should have_link('Sign Out', href: signout_path) }
  it { should_not have_link('Sign In', href: signin_path) }
end

def invalid_signin
     before { click_button "Sign In" }
        it { should have_selector('title', text: 'Sign In')}
        it { should have_selector('div.alert.alert-error', text: 'Invalid')}
        describe "After visiting another page" do
            before {click_link "Home"}
            it { should_not have_selector('div.alert-error')}
        end
end

def signin_page
    before { visit signin_path }
        it { should have_selector('title', text: 'Sign In')}
        it { should have_selector('h1', text: 'Sign In')}
end

RSpec::Matchers.define :have_error_message do |message|
  match do |page|
    page.should have_selector('div.alert.alert-error', text: message)
  end
end