#! /usr/bin/env ruby 
#-*- coding: utf-8 -*-
# Author: qjp
# Date: <2013-10-26 Sat>

require_relative '../model'

class CourseMeta < TWLB::Model
  define_fields {
    String :course_name
    String :course_url
  }
end
