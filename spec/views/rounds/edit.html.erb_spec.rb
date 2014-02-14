require 'spec_helper'

describe "rounds/edit" do
  before(:each) do
    @round = assign(:round, stub_model(Round,
      :number => 1,
      :image_a => "MyString",
      :image_b => "MyString"
    ))
  end

  it "renders the edit round form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", round_path(@round), "post" do
      assert_select "input#round_number[name=?]", "round[number]"
      assert_select "input#round_image_a[name=?]", "round[image_a]"
      assert_select "input#round_image_b[name=?]", "round[image_b]"
    end
  end
end
