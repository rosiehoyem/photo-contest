require 'spec_helper'

describe "images/index" do
  before(:each) do
    assign(:images, [
      stub_model(Image,
        :flickr_id => "Flickr",
        :owner => "Owner",
        :title => "Title",
        :url => "Url"
      ),
      stub_model(Image,
        :flickr_id => "Flickr",
        :owner => "Owner",
        :title => "Title",
        :url => "Url"
      )
    ])
  end

  it "renders a list of images" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Flickr".to_s, :count => 2
    assert_select "tr>td", :text => "Owner".to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Url".to_s, :count => 2
  end
end
