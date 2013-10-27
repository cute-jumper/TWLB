#! /usr/bin/env ruby 
#-*- coding: utf-8 -*-
# Author: qjp
# Date: <2013-10-26 Sat>

require_relative 'schema_generator'

module TWLB
  class Model
    def self.define_fields(&block)
      schema = TWLB::SchemaGenerator.new(&block)
      self.send(:define_method, :initialize) do |args|
        schema.columns.each do |c|
          instance_variable_set("@#{c[:name]}", args[c[:name].to_sym])
        end
      end
      schema.columns.each do |c|
        class_eval {attr_reader c[:name]}
      end
    end
  end
end
