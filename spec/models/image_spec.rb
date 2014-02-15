require 'spec_helper'

describe Image do

  it "is invalid without a flickr_id" do
      image = FactoryGirl.build(:image, flickr_id: nil)
      expect(image).to have(1).errors_on(:flickr_id)
  end

  it "is invalid without an owner" do
      image = FactoryGirl.build(:image, owner: nil)
      expect(image).to have(1).errors_on(:owner)
  end

  it "is invalid without an title" do
      image = FactoryGirl.build(:image, title: nil)
      expect(image).to have(1).errors_on(:title)
  end

  it "is invalid without a url" do
      image = FactoryGirl.build(:image, url: nil)
      expect(image).to have(1).errors_on(:url)
  end
end
