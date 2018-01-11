require 'rails_helper'

describe "Designer can interact with orders" do
  it "they can mark them as 'received" do
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
    click_on "Accept Application"
    click_on "Logout"

    login_user(producer.username, producer.password)
    
    click_on "Orders"
    click_on Order.last.id
    click_on "Mark Order as 'Shipped'!"
    click_on "Logout"

    login_user(user.username, user.password)

    click_on 'Orders'
    click_on Order.last.id

    click_on "Mark Order as 'Received'!"

    order = Order.last
    expect(current_path).to eq(designer_order_path(user, order))
    expect(page).to have_content("Order ##{order.id} has been marked as 'received'.")
    expect(order.status).to eq('received')

  end
end