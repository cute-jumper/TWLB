#! /usr/bin/env ruby 
#-*- coding: utf-8 -*-
# Author: qjp
# Date: <2013-10-26 Sat>

require_relative '../model'

class CourseDocuments < TWLB::Model
  define_fields {
    Integer :document_sequence_number
    String :document_heading
    String :document_brief_explanation
    String :document_file_size_text
    Date :document_uploading_time
    TrueClass :document_status
    File :document_file
  }
end

