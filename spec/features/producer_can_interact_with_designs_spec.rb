require 'rails_helper'

describe "Producer can interact with designs" do
  it "they can apply to one" do
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

    login_user(producer.username, producer.password)
    
    expect(current_path).to eq(producer_dashboard_path(producer))

    click_on "Designs"
    click_on "dress"

    expect(current_path).to eq(producer_design_path(producer, design))
    click_on "Apply to Design!"
    
    expect(current_path).to eq(new_producer_design_application_path(producer, design))
    
    fill_in "application[production_plan]", with: "a new production plan"
    fill_in "application[price]", with: '15'
    
    click_on "Apply to Design"

    expect(current_path).to eq(producer_dashboard_path(producer))
  end

  it "they can only apply once" do
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

    login_user(producer.username, producer.password)
    
    visit producer_design_path(producer, design)

    expect(page).not_to have_content('Apply to Design!')

    click_on 'View your application!'

    expect(current_path).to eq(producer_design_application_path(producer, design, app))
    expect(page).to have_content(app.production_plan)
  end

end