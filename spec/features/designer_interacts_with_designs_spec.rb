require 'rails_helper'

describe "Designer interacts with designs" do
  before :each do
    @user = User.create(username: "designer",
                        password: "test",
                        role: 0
                        )
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
    @design = @user.designs.create(title: "wrap dress",
                                   description: "cherry print with tie at waistline",
                                   image_url: "x",
                                   due_date: "2018-02-03 15:17:42 -0700",
                                   price_range: "$30-50")
  end

  it "they can view all designs" do   
    visit designer_dashboard_path(@user)

    click_on "Designs"

    expect(current_path).to eq(designer_designs_path(@user))

    expect(page).to have_content("1 Design")
    expect(page).to have_css('.design', count: @user.designs.count)
    within(first('.design')) do
      expect(page).to have_css('.title')
      expect(page).to have_css('.description')
      expect(page).to have_css('.image-url')
      expect(page).to have_css('.due-date')
      expect(page).to have_css('.price-range')
      expect(page).to have_css('.created-at')
    end
  end

  it "they can view a specific design" do
    visit designer_designs_path(@user)

    click_on @design.title

    expect(current_path).to eq(designer_design_path(@user, @design))

    expect(page).to have_css('.title')
    expect(page).to have_css('.description')
    expect(page).to have_css('.image-url')
    expect(page).to have_css('.due-date')
    expect(page).to have_css('.price-range')
    expect(page).to have_css('.created-at')

    expect(page).to have_link('Edit')
  end

  it "they can edit a design" do
    visit edit_designer_design_path(@user, @design)

    expect(page).to have_field("design[title]")
    expect(page).to have_field("design[description]")
    expect(page).to have_field("design[image_url]")
    expect(page).to have_field("design[due_date]")
    expect(page).to have_field("design[price_range]")

    fill_in "design[description]", with: "a-line skirt with rose print"

    click_on "Update Design"

    expect(current_path).to eq(designer_design_path(@user, @design))
    expect(page).to have_content("a-line skirt with rose print")
    expect(page).not_to have_content("cherry print with tie at waistline")
  end

  it "they can create a design" do
    visit designer_designs_path(@user)
    
    click_on "Post a Design"

    expect(current_path).to eq(new_designer_design_path(@user))

    fill_in "design[title]", with: "test design"
    fill_in "design[description]", with: "looks like a test design"
    fill_in "design[image_url]", with: "www.example.com"
    fill_in "design[due_date]", with: "2018-05-03 15:17:42 -0700"
    fill_in "design[price_range]", with: "75-90"

    click_on "Create Design"

    expect(current_path).to eq(designer_designs_path(@user))
    expect(page).to have_css('.design', count: 2)
    expect(page).to have_link('test design')
  end

  it "they can delete a design" do
    visit designer_designs_path(@user)

    expect(page).to have_content(@design.title)

    click_on @design.title
    click_on "Delete Design"

    expect(current_path).to eq(designer_designs_path(@user))

    expect(page).to have_content("#{@design.title} has been removed from your designs.")
  end

end