require 'rails_helper'

describe "Admin can change status of designs" do
  let!(:admin) { User.create(username: "admin",
                      password: "test",
                      role: "admin") }

  let!(:user) { User.create(username: "designer",
                      password: "test",
                      role: 0) }
  before :each do
    login_user(admin.username, admin.password)
    @design = user.designs.create(title: "wrap dress",
                      description: "cherry print with tie at waistline",
                      image_url: "x",
                      due_date: "2018-02-03 15:17:42 -0700",
                      price_range: "$30-50")
  end
                      
  it "they can approve a design" do
    visit admin_dashboard_path(admin)
   
    expect(@design.status).to eq("pending")
    click_on "Designs Pending Approval: 1"

    expect(current_path).to eq(admin_designs_path(admin))

    click_on @design.title

    expect(current_path).to eq(admin_design_path(admin, @design))

    expect(page).to have_content(@design.title)
    click_on "Approve"
    
    expect(current_path).to eq(admin_designs_path(admin))
    expect(page).to have_content("#{@design.title} has been approved")
    
    expect(page).not_to have_link(@design.title)
    
    visit admin_dashboard_path(admin)

    expect(page).to have_content("Designs Pending Approval: 0")
  end

  it "they can decline a design" do
    visit admin_design_path(admin, @design)

    expect(page).to have_content(@design.title)

    click_on "Decline"

    expect(current_path).to eq(admin_designs_path(admin))
    expect(page).to have_content("#{@design.title} has been declined")

    expect(page).not_to have_link(@design.title)

    visit admin_dashboard_path(admin)

    expect(page).to have_content("Designs Pending Approval: 0")
  end
end