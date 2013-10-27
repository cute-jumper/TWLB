#! /usr/bin/env ruby 
#-*- coding: utf-8 -*-
# Author: qjp
# Date: <2013-10-26 Sat>

module TWLB
  class Course
    @@instance_id = 0
    def initialize(name, url)
      @attributes = Hash.new
      @course_id = @@instance_id
      @@instance_id += 1
      @course_name, @course_url = name, url
    end
  end
end
