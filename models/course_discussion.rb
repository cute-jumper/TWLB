#! /usr/bin/env ruby 
#-*- coding: utf-8 -*-
# Author: qjp
# Date: <2013-10-26 Sat>

require_relative '../model'

class CourseDiscussion < TWLB::Model
  define_fields {
    Integer :discussion_id
    String :discussion_subject
    String :discussion_publisher
    String :discussion_publishing_time
    String :discussion_text
    Integer :discussion_reply_count
    Integer :discussion_click_count
    File :discussion_attachment
  }
end
