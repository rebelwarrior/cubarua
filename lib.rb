#! /usr/bin/env ruby
# encoding: utf-8
# lib.rb

#Can I separate this into it's own class for testing?
def sanitize(sql_query)
  sql_query[0..22].downcase.split('').each.select {|w| w =~ /[a-z]|[áéíóúü]/i}.join('') 
end
