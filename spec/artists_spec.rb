require 'spec_helper'

describe ArtistAPI do

  context 'requesting top 10 artists' do
    before(:all) do
      @api_call = ArtistAPI.new
      @artists = @api_call.artist_index_service.get_all_artists
    end
    it "should respond with an array" do
      expect(@artists).to be_a Array
    end
    it "should be of length 20" do
      expect(@artists.length).to eq 20
    end
  end

  context 'requesting artists' do
    before(:all) do
      @api_call = ArtistAPI.new
      @artist = @api_call.artist_show_service.get_show_artist("Cream")
    end
    it "should respond with a Hash" do
      expect(@artist).to be_a Hash
    end
    it "should have a name" do
      expect(@artist["name"]).to_not be_nil
    end
    it "should have a summary" do
      expect(@artist["bio"]["summary"]).to_not be_nil
    end
    it "should have tags" do
      expect(@artist["tags"]).to_not be_nil
    end
    it "should have similar artists" do
      expect(@artist["similar"]).to_not be_nil
    end
    it "should have a image link" do
      expect(@artist["image"][3]["#text"]).to_not be_nil
    end
    it "image link should be png" do
      expect(@artist["image"][3]["#text"].chars.last(3).join).to eq "png"
    end
  end

  context 'requesting album' do
    before(:all) do
      @api_call = ArtistAPI.new
      @albums = @api_call.album_index_service.get_top3_albums("Cream")
    end
    it "should respond with an array" do
      expect(@albums).to be_a Array
    end
    it "should be of length 3" do
      expect(@albums.length).to eq 3
    end
    it "should have name and image" do
      expect(@albums[0]["name"]).to_not be_nil
      expect(@albums[0]["image"][2]["#text"]).to_not be_nil
    end
  end

  context 'searching artist' do
    before(:all) do
      @api_call = ArtistAPI.new
      @result = @api_call.artist_search_service.get_search("Cre")
    end
    it "should respond with an array" do
      expect(@result).to be_a Array
    end
    it "should be of length 10" do
      expect(@result.length).to eq 10
    end
    it "should have name and image" do
      expect(@result[0]["name"]).to_not be_nil
      expect(@result[0]["image"][2]["#text"]).to_not be_nil
    end
  end

end
