#! /usr/bin/env ruby
# encoding: utf-8
# CubaRua.rb

require 'cuba'
require 'active_record'
require 'sqlite3' # this should be required only on dev.
require 'rack/contrib/jsonp'
require './models.rb'

Cuba.use Rack::JSONP

# Put in helper file?
def sanitize(sql_query)
  sql_query[0..22].downcase.split('').each.select {|w| w =~ /[a-z]|[áéíóúü]/i}.join('') 
end

Cuba.define do
  on get do
    on root do
      res.write "Hello Puerto Rico!"
    end
    on "all" do
      res.write Agency.all.to_json
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
end

__END__