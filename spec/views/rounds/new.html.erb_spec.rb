require 'spec_helper'

describe "rounds/new" do
  before(:each) do
    assign(:round, stub_model(Round,
      :number => 1,
      :image_a => "MyString",
      :image_b => "MyString"
    ).as_new_record)
  end

  it "renders new round form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", rounds_path, "post" do
      assert_select "input#round_number[name=?]", "round[number]"
      assert_select "input#round_image_a[name=?]", "round[image_a]"
      assert_select "input#round_image_b[name=?]", "round[image_b]"
    end
  end
end
