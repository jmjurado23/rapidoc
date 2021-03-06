require "spec_helper"

include Rapidoc

describe Rapidoc do
  context "when create estructure" do
    before do
      create_structure
    end

    it "should create config files" do
      File.exists?( config_dir( "rapidoc.yml" ) ).should == true
    end

    it "should create target dir" do
      File.directory?( target_dir ).should == true
    end
  end

  context "when executing genarate_doc function" do
    before do
      create_structure
      generate_doc( get_resources )
    end

    after do
      `rm -r #{::Rails.root.to_s + "/rapidoc"}`
    end

    it "should create new index.html file" do
      File.exists?( ::Rails.root.to_s + "/rapidoc/index.html" ).should == true
    end
  end

end
