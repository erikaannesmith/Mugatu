require 'rails_helper'

describe "Designer can interact with applications" do
  it "they can approve them" do
    user = User.create(username: 'designer',
                       password: 'test',
                       role: 'designer')
    producer = User.create(username: 'producer',
                       password: 'test',
                       role: 'producer')
    design = user.designs.create(title: 'dress',
                       description: 'leopard print',
                       price_range: '10',
                       due_date: Date.new)
    design.active!
    app = producer.applications.create(production_plan: "a new plan",
                                 due_date: Date.new,
                                 price: '10',
                                 design: design)

    login_user(user.username, user.password)

    click_on 'dress'

    expect(page).to have_content('Applications')

    click_on app.id

    expect(current_path).to eq(designer_design_application_path(user, design, app))

    click_on "Accept Application"

    expect(page).to have_content("Order ##{Order.last.id} has been created for #{design.title}!")
    expect(current_path).to eq(designer_order_path(user, Order.last))
  end

  it "they can decline them" do
    user = User.create(username: 'designer',
                       password: 'test',
                       role: 'designer')
    producer = User.create(username: 'producer',
                       password: 'test',
                       role: 'producer')
    design = user.designs.create(title: 'dress',
                       description: 'leopard print',
                       price_range: '10',
                       due_date: Date.new)
    design.active!
    app = producer.applications.create(production_plan: "a new plan",
                                 due_date: Date.new,
                                 price: '10',
                                 design: design)

    login_user(user.username, user.password)

    click_on 'dress'
    click_on app.id
    click_on "Decline Application"

    expect(current_path).to eq(designer_design_path(user, design))
  end

end