require 'rails_helper'

describe User do
  it "can be created as an admin" do
    user = User.create(username: "admin",
                       password: "test",
                       role: 2)
    expect(user.role).to eq("admin")
  end

  it "can be created as a designer" do
    user = User.create(username: "designer",
                       password: "test",
                       role: 0)
    

    expect(user.role).to eq("designer")
  end

  it "can be created as a producer" do
    user = User.create(username: "producer",
                       password: "test",
                       role: 1)

    expect(user.role).to eq("producer")
  end
end