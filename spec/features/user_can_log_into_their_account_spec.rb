require 'rails_helper'

describe "User can log into their account" do
  it "They will be logged in as the current_user" do
    user = User.create(username: "designer",
                       password: "test")
    visit '/'
    click_on "I already have an account"

    expect(current_path).to eq(login_path)

    fill_in "username", with: user.username
    fill_in "password", with: user.password
    click_on "Log In"

    expect(current_path).to eq(designer_dashboard_path(user))
    expect(page).to have_content("Welcome, #{user.username}!")
    expect(page).to have_link("Logout")

    click_on "Logout"

    expect(current_path).to eq(root_path)
  end
end