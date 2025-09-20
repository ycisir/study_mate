require 'rails_helper'

RSpec.describe "rooms/index", type: :view do
  before(:each) do
    assign(:rooms, [
      Room.create!(
        name: "Name",
        desc: "MyText"
      ),
      Room.create!(
        name: "Name",
        desc: "MyText"
      )
    ])
  end

  it "renders a list of rooms" do
    render
    cell_selector = 'div>p'
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("MyText".to_s), count: 2
  end
end
