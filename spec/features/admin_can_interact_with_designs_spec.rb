require 'rails_helper'

describe "Admin can interact with designs" do
  it "they can approve a design" do
    designer = User.create(username: 'designer',
                       password: 'test',
                       role: 'designer')
    admin = User.create(username: 'admin',
                       password: 'test',
                       role: 'admin')                 
    login_user(designer.username, designer.password)

    click_on "Post a Design"

    fill_in 'design[title]', with: 'dress'
    fill_in 'design[description]', with: 'cherry print'
    fill_in 'design[price_range]', with: '20-30'

    click_on "Create Design"
    click_on "Logout"

    login_user(admin.username, admin.password)

    click_on "Pending Designs (1)"

    click_on 'dress'

    design = Design.last
    expect(design.status).to eq('pending')
    expect(current_path).to eq(admin_design_path(admin, design))
    
    click_on "Approve"
    
    expect(current_path).to eq(admin_dashboard_path(admin))
    expect(page).to have_content('dress has been approved')

    click_on "All Designs"

    expect(page).to have_content('dress')
    expect(Design.last.status).to eq('active')
  end

  it "they can decline a design" do
    designer = User.create(username: 'designer',
                       password: 'test',
                       role: 'designer')
    admin = User.create(username: 'admin',
                       password: 'test',
                       role: 'admin')                 
    login_user(designer.username, designer.password)

    click_on "Post a Design"

    fill_in 'design[title]', with: 'dress'
    fill_in 'design[description]', with: 'cherry print'
    fill_in 'design[price_range]', with: '20-30'

    click_on "Create Design"
    click_on "Logout"

    login_user(admin.username, admin.password)

    click_on "Pending Designs (1)"

    click_on 'dress'
    
    design = Design.last
    expect(design.status).to eq('pending')
    expect(current_path).to eq(admin_design_path(admin, design))
    
    click_on "Decline"
    
    expect(current_path).to eq(admin_dashboard_path(admin))
    expect(page).to have_content('dress has been declined')

    click_on "All Designs"

    expect(page).to have_content('dress')    
    expect(Design.last.status).to eq('declined')
  end


end