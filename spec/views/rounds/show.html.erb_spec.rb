require 'spec_helper'

describe "rounds/show" do
  before(:each) do
    @round = assign(:round, stub_model(Round,
      :number => 1,
      :image_a => "Image A",
      :image_b => "Image B"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/Image A/)
    rendered.should match(/Image B/)
  end
end
