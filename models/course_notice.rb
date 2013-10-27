#! /usr/bin/env ruby 
#-*- coding: utf-8 -*-
# Author: qjp
# Date: <2013-10-26 Sat>

require_relative '../model'

class CourseNotice < TWLB::Model
  define_fields {
    Integer :notice_number
    String :notice_heading
    String :notice_publisher
    Date :notice_date
    TrueClass :notice_status
  }
end
