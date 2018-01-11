require 'rails_helper'

describe "User can log in" do
  it "as an administrator" do
    user = User.create(username: 'user',
                       password: 'test',
                       role: 'admin')

    visit '/'

    fill_in "username", with: 'user'
    fill_in "password", with: 'test'
    click_on 'Log In'

    expect(current_path).to eq(admin_dashboard_path(user))
  end

  it "as a designer" do
    user = User.create(username: 'user',
                       password: 'test',
                       role: 'designer')

    visit '/'

    fill_in "username", with: 'user'
    fill_in "password", with: 'test'
    click_on 'Log In'

    expect(current_path).to eq(designer_dashboard_path(user))
  end

  it "as a producer" do
    user = User.create(username: 'user',
                       password: 'test',
                       role: 'producer')

    visit '/'

    fill_in "username", with: 'user'
    fill_in "password", with: 'test'
    click_on 'Log In'

    expect(current_path).to eq(producer_dashboard_path(user))
  end

end