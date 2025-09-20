require 'rails_helper'

RSpec.describe Topic, type: :model do
  it "is valid with valid attributes" do
    topic = Topic.new(name: "Ruby")
    expect(topic).to be_valid
  end
end
