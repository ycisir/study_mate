require 'rails_helper'

RSpec.describe "rooms/show", type: :view do
  before(:each) do
    assign(:room, Room.create!(
      name: "Name",
      desc: "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
  end
end
