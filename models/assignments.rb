#! /usr/bin/env ruby 
#-*- coding: utf-8 -*-
# Author: qjp
# Date: <2013-10-26 Sat>

require_relative '../model'

class Assignments < TWLB::Model
  define_fields {
    String :assignment_title
    Date :assignment_start_date
    Date :assignment_due_date
    String :assignment_submit_status
    String :assignment_attachment_size_text
    String :assignment_specification
    File :assignment_work_attachment_file
    String :assignment_upload_work_string
    File :assignment_upload_attachment_file
  }
end
