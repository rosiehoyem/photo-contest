require 'spec_helper'

describe "rounds/index" do
  before(:each) do
    assign(:rounds, [
      stub_model(Round,
        :number => 1,
        :image_a => "Image A",
        :image_b => "Image B"
      ),
      stub_model(Round,
        :number => 1,
        :image_a => "Image A",
        :image_b => "Image B"
      )
    ])
  end

  it "renders a list of rounds" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Image A".to_s, :count => 2
    assert_select "tr>td", :text => "Image B".to_s, :count => 2
  end
end
