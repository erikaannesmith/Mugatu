require 'rails_helper'

describe "Admin order permissions" do
  it "they can view all orders" do
    admin = User.create(username: "admin",
                        password: "test",
                        role: "admin")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_orders_path
    expect(page).to have_content("Admin Orders")
  end

  it "default users cannot view admin orders" do
    user = User.create(username: "designer",
                       password: "test",
                       role: "designer")

    expect(user.role).to eq("designer")
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    
    visit admin_orders_path

    expect(page).not_to have_content("Admin Orders")
    expect(page).to have_content("The page you were looking for doesn't exist.")
  end
end