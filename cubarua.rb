#! /usr/bin/env ruby
# encoding: utf-8
# CubaRua.rb

%w[cuba cuba/render active_record sqlite3 rack/contrib/jsonp].each do |lib|
  require lib
end
%w[models.rb lib.rb].each do |file|
  require "./#{file}"
end

Cuba.use Rack::JSONP
# Cuba.plugin Cuba::Render + res.write render("home.haml", content: "hello, world")
Cuba.plugin Cuba::Render

Cuba.define do
  on get do
    on root do
      res.write "Hello Puerto Rico!" + Cuba.settings.to_s
    end
    on "api/v1" do
      on "all", param('callback') do
        if param('callback')
          puts "___________________"
          puts param('callback')
          puts "-------------------"
          res.write (param('callback')['json' => Agency.all.to_json])     
        else
          res.write Agency.all.to_a.to_json
        end
        # res.write render(Agency.all.to_json, :callback => params[:callback])
      end
      on "id/:id" do |id|
        agency_ref_number = Agency.find_by_ref_number(id)
        res.write agency_ref_number.to_json
      end
      on "search/:query" do |query|
        q = "%#{sanitize(query)}%"
        # puts "Recieved / query: #{query[0..22]} Sanitized: #{q} At #{Time.now}"
        agency_name_search_results = Agency.where('lower(agency_name) LIKE ?', q)
        res.write agency_name_search_results.to_json     
      end
      #search?q=DeptRedundacy
      on "search", param('q') do |query|
        q = "%#{sanitize(query)}%"
        # puts "Search ?q= Query: #{query[0..22]} Sanitized: #{q} At #{Time.now}"
        agency_name_search_results = Agency.where('lower(agency_name) LIKE ?', q)
        res.write agency_name_search_results.to_json     
      end
    end
    on "help" do 
      res.write render("./public/home.haml") #, content: "hello, world")
    end    
  end
end

__END__