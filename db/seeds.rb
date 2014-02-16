# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

contest = Contest.new(api_key: "strike-near-none-clock-paris-58", active_round: 1)
images = contest.images.create([{"contest_id"=>22, "flickr_id"=>"12546923914", "id"=>35585, "owner"=>"13017706@N00", "title"=>"7/52 - love is in the air", "url"=>"http://farm3.staticflickr.com/2806/12546923914_05ec740ae7_z.jpg"}}, 
  {"contest_id"=>22, "flickr_id"=>"12540615635", "id"=>35586, "owner"=>"66849424@N07", "title"=>"Kongeørn (golden eagle) - aquila chrysaetos (5)", "url"=>"http://farm6.staticflickr.com/5479/12540615635_4746830c06_z.jpg"}, 
  {"contest_id"=>22, "flickr_id"=>"11957543824", "id"=>35587, "owner"=>"27278265@N02", "title"=>"Plectrophanes des neiges", "url"=>"http://farm3.staticflickr.com/2834/11957543824_cd3daab21b_z.jpg"}, 
  {"contest_id"=>22, "flickr_id"=>"12536912333", "id"=>35588, "owner"=>"36524915@N05", "title"=>"Crowd Restaurant", "url"=>"http://farm8.staticflickr.com/7371/12536912333_10d25d2cf7_z.jpg"}, 
  {"contest_id"=>22, "flickr_id"=>"6922629300", "id"=>35589, "owner"=>"70139913@N02", "title"=>"Rotkehlchen in der Sonne - Robin in the sun", "url"=>"http://farm8.staticflickr.com/7243/6922629300_92467e0d85_z.jpg"}, 
  {"contest_id"=>22, "flickr_id"=>"4094588295", "id"=>35590, "owner"=>"97042891@N00", "title"=>"Tucano - Jardim Botânico do Rio de Janeiro", "url"=>"http://farm3.staticflickr.com/2451/4094588295_b968863fc3_z.jpg?zz=1"},
  {"contest_id"=>22, "flickr_id"=>"12525380134", "id"=>35591, "owner"=>"53806937@N00", "title"=>"7/52 - Focus {wishing for telekinetic powers}", "url"=>"http://farm4.staticflickr.com/3763/12525380134_e2dc58d4bb_z.jpg"}, 
  {"contest_id"=>22, "flickr_id"=>"12524490254", "id"=>35592, "owner"=>"43695360@N02", "title"=>"~ Happy Valentines Day,,! ~", "url"=>"http://farm8.staticflickr.com/7409/12524490254_8a34d4d625_z.jpg"}, 
  {"contest_id"=>22, "flickr_id"=>"12524017114", "id"=>35593, "owner"=>"71833159@N00", "title"=>"Happy Valentine's Day, everyone!", "url"=>"http://farm8.staticflickr.com/7371/12524017114_529f877b16_z.jpg"}, 
  {"contest_id"=>22, "flickr_id"=>"12521481695", "id"=>35594, "owner"=>"41890366@N03", "title"=>"Heart Full of Love", "url"=>"http://farm6.staticflickr.com/5491/12521481695_b72e106ab3_z.jpg"}, 
  {"contest_id"=>22, "flickr_id"=>"12521830174", "id"=>35595, "owner"=>"32649792@N00", "title"=>"Love Birds - Happy Valentine's Day 2014", "url"=>"http://farm3.staticflickr.com/2881/12521830174_00a21cb332_z.jpg"}, 
  {"contest_id"=>22, "flickr_id"=>"12493464395", "id"=>35596, "owner"=>"23990407@N04", "title"=>"I GOT 6 IN A ROW", "url"=>"http://farm4.staticflickr.com/3673/12493464395_08e9836e97_z.jpg"}, 
  {"contest_id"=>22, "flickr_id"=>"12516788974", "id"=>35597, "owner"=>"46143783@N04", "title"=>"Love is Color Blind 1 - Vancouver, British Columbia", "url"=>"http://farm8.staticflickr.com/7443/12516788974_04551b0acd_z.jpg"}
  , {"contest_id"=>22, "flickr_id"=>"12509173634", "id"=>35598, "owner"=>"88135282@N02", "title"=>"Ice & snow storm", "url"=>"http://farm3.staticflickr.com/2858/12509173634_75134bbf61_z.jpg"}, 
  {"contest_id"=>22, "flickr_id"=>"12509199314", "id"=>35599, "owner"=>"106952114@N02", "title"=>"Blueberry Valentine muffins", "url"=>"http://farm4.staticflickr.com/3760/12509199314_2cca84fe94_z.jpg"}, 
  {"contest_id"=>22, "flickr_id"=>"12508287455", "id"=>35600, "owner"=>"27077595@N00", "title"=>"Tufted Titmouse!!", "url"=>"http://farm6.staticflickr.com/5528/12508287455_5523be10ab_z.jpg"}]
