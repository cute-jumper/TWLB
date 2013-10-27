#! /usr/bin/env ruby 
#-*- coding: utf-8 -*-
# Author: qjp
# Date: <2013-10-26 Sat>

require_relative '../model'

class TeachingMaterial < TWLB::Model
  define_fields {
    String :material_link_name
    String :material_brief_explanation
  }
end
