require 'spec_helper'

describe "contests/edit" do
  before(:each) do
    @contest = assign(:contest, stub_model(Contest,
      :name => "MyString",
      :active_round => 1,
      :posted => false
    ))
  end

  it "renders the edit contest form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", contest_path(@contest), "post" do
      assert_select "input#contest_name[name=?]", "contest[name]"
      assert_select "input#contest_active_round[name=?]", "contest[active_round]"
      assert_select "input#contest_posted[name=?]", "contest[posted]"
    end
  end
end
