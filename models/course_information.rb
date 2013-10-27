#! /usr/bin/env ruby 
#-*- coding: utf-8 -*-
# Author: qjp
# Date: <2013-10-26 Sat>

require_relative '../model'

class CourseInformation < TWLB::Model
  define_fields {
    String :course_number_text
    Integer :course_sequence_number
    String :course_name
    Integer :course_credit
    Integer :course_hours
    Integer :course_group_number
    String :course_representative
    Integer :course_teacher_id
    String :course_textbook
    String :course_reference_books
    String :course_exam
    String :course_teaching_pattern
    String :course_introduction
    String :course_teaching_plan
  }
end
