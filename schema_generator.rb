#! /usr/bin/env ruby 
#-*- coding: utf-8 -*-
# Author: qjp
# Date: <2013-10-26 Sat>

# Borrow some of the code from
# https://github.com/jeremyevans/sequel/blob/master/lib/sequel/database/schema_generator.rb

module TWLB
  class SchemaGenerator
    %w(bigdecimal date).each {|f| require f}
    
    GENERIC_TYPES = [String, Integer, Fixnum, Bignum, Float, Numeric, BigDecimal,
                     Date, DateTime, Time, File, TrueClass, FalseClass].freeze
    
    SERIAL_PRIMARY_KEY_OPTIONS = {:primary_key => true, :type => Integer, :auto_increment => true}.freeze
    
    attr_reader :columns
    
    def initialize(&block)
      @columns = []
      @primary_key = nil
      instance_eval(&block) if block
      @columns.unshift(@primary_key) if @primary_key && !has_column(primary_key_name)
    end
    
    def self.add_type_method(*types)
      types.each do |type|
        class_eval <<-EOT, __FILE__, __LINE__ + 1
        def #{type}(name, opts={})         # def String(name, opts={})
          column(name, #{type}, opts)      #   column(name, String, opts)
        end                                # end
      EOT
      end
    end
    
    add_type_method(*GENERIC_TYPES)
    
    def column(name, type, opts=OPTS)
      columns << {:name => name, :type => type}.merge(opts)
    end
    
    def has_column?(name)
      columns.any? {|c| c[:name] == name}
    end
    
    def primary_key(name, opts=OPTS)
      @primary_key = {:name => name}.merge(SERIAL_PRIMARY_KEY_OPTIONS)
    end
    
    def primary_key_name
      @primary_key[:name] if @primary_key
    end
    
  end
end
