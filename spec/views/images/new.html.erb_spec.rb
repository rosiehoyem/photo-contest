require 'spec_helper'

describe "images/new" do
  before(:each) do
    assign(:image, stub_model(Image,
      :flickr_id => "MyString",
      :owner => "MyString",
      :title => "MyString",
      :url => "MyString"
    ).as_new_record)
  end

  it "renders new image form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", images_path, "post" do
      assert_select "input#image_flickr_id[name=?]", "image[flickr_id]"
      assert_select "input#image_owner[name=?]", "image[owner]"
      assert_select "input#image_title[name=?]", "image[title]"
      assert_select "input#image_url[name=?]", "image[url]"
    end
  end
end
