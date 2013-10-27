#! /usr/bin/env ruby 
#-*- coding: utf-8 -*-
# Author: qjp
# Date: <2013-10-20 Sun>

require 'sqlite3'
require 'yaml'

module TWLB
  class DBManager
    def initialize(config_file, course_list)
      yml = YAML.load_file(config_file)
      @db = SQLite3::Database.open yml['database']['db_name']
      ObjectSpace.define_finalizer(self) {@db.close if db}
      course_list.each do |course|
        create_table course
      end
    end
    def create_table(course)
      "CREATE TABLE IF NOT EXISTS #{course.course_name}(course_id INTEGER PRIMARY KEY,\
course_name TEXT, course_url TEXT)" # TODO
    end
  end
end
