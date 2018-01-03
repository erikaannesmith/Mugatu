require 'rails_helper'

describe "Visitor can sign up as a user" do
  it "They can register as a designer" do
    visit '/'
    click_on "Sign Up"
    expect(current_path).to eq(new_user_path)
    within ".sign-up-field" do
      fill_in "user[username]", with: "designer"
      fill_in "user[password]", with: "test"
      select "designer", from: "user[role]"
      click_on "Sign Up"
    end
    expect(current_path).to eq(designer_dashboard_path(User.last))
    expect(page).to have_content("Welcome, designer!")
  end
  
  it "They can register as a producer" do
    visit '/'
    click_on "Sign Up"
    expect(current_path).to eq(new_user_path)
    within ".sign-up-field" do
      fill_in "user[username]", with: "producer"
      fill_in "user[password]", with: "test"
      select "producer", from: "user[role]"
      click_on "Sign Up"
    end
    expect(current_path).to eq(producer_dashboard_path(User.last))
    expect(page).to have_content("Welcome, producer!")
  end
end