# encoding: utf-8
# Models.rb #Cuba
ActiveRecord::Base.establish_connection(
    adapter:  'sqlite3',
    database: 'db.sqlite3',
    host:     'localhost', )


class Agency < ActiveRecord::Base
  validates_uniqueness_of :ref_number
  validates_presence_of :ref_number, :agency_name
end

# OpenShift
# ActiveRecord::Base.establish_connection(
#     adapter:  'sqlite3',
#     database: '../data/db.sqlite3',
#     host:     'localhost', )
