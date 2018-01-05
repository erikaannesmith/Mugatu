require 'rails_helper'

describe "Designer views designs" do
  let(:designer) { User.create(username: "designer",
                              password: "test",
                              role: 0
                              ) }

  before :each do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(designer)
  end
                          
  it "they can view design with status" do
    design = designer.designs.create(title: "wrap dress",
                                    description: "cherry print with tie at waistline",
                                    image_url: "x",
                                    due_date: "2018-02-03 15:17:42 -0700",
                                    price_range: "$30-50",
                                    status: 'active'
                            )
    visit designer_designs_path(designer)

    expect(page).to have_content(design.title)
    expect(page).to have_content("Active")
  end
end