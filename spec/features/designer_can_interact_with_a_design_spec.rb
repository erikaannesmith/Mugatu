require 'rails_helper'

describe "Designer can interact with a design" do
  it "by creating one" do
    user = User.create(username: 'user',
                       password: 'test',
                       role: 'designer')
    login_user(user.username, user.password)

    expect(current_path).to eq(designer_dashboard_path(user))

    click_on "Post a Design"

    expect(current_path).to eq(new_designer_design_path(user))

    fill_in 'design[title]', with: 'dress'
    fill_in 'design[description]', with: 'cherry print'
    fill_in 'design[price_range]', with: '20-30'

    click_on "Create Design"

    expect(current_path).to eq(designer_dashboard_path(user))
    
    click_on "Designs"

    expect(page).to have_content('dress')
  end

  it "by editing one" do
    user = User.create(username: 'user',
                       password: 'test',
                       role: 'designer')
    login_user(user.username, user.password)

    click_on "Post a Design"

    fill_in 'design[title]', with: 'dress'
    fill_in 'design[description]', with: 'cherry print'
    fill_in 'design[price_range]', with: '20-30'

    click_on "Create Design"

    visit designer_design_path(user, Design.last)

    click_on "Edit Design"

    expect(current_path).to eq(edit_designer_design_path(user, Design.last))

    fill_in "design[description]", with: 'leopard print'

    click_on 'Create Design'

    expect(current_path).to eq(designer_design_path(user, Design.last))
    expect(page).to have_content('leopard print')
    expect(page).not_to have_content('cherry print')
  end

  it "by deleting one" do
    user = User.create(username: 'user',
                       password: 'test',
                       role: 'designer')
    login_user(user.username, user.password)

    click_on "Post a Design"

    fill_in 'design[title]', with: 'dress'
    fill_in 'design[description]', with: 'cherry print'
    fill_in 'design[price_range]', with: '20-30'

    click_on "Create Design"

    visit designer_design_path(user, Design.last)

    click_on "Delete Design"

    expect(current_path).to eq(designer_dashboard_path(user))
    expect(page).to have_content('dress has been removed from your designs.')
    within '.designs' do
      expect(page).not_to have_content('dress')
    end
  end

end