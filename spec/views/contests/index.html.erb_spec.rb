require 'spec_helper'

describe "contests/index" do
  before(:each) do
    assign(:contests, [
      stub_model(Contest,
        :name => "Name",
        :active_round => 1,
        :posted => false
      ),
      stub_model(Contest,
        :name => "Name",
        :active_round => 1,
        :posted => false
      )
    ])
  end

  it "renders a list of contests" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
