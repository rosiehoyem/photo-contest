require 'spec_helper'

describe "images/show" do
  before(:each) do
    @image = assign(:image, stub_model(Image,
      :flickr_id => "Flickr",
      :owner => "Owner",
      :title => "Title",
      :url => "Url"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Flickr/)
    rendered.should match(/Owner/)
    rendered.should match(/Title/)
    rendered.should match(/Url/)
  end
end
