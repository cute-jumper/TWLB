#! /usr/bin/env ruby 
#-*- coding: utf-8 -*-
# Author: qjp
# Date: <2013-10-17 Thu>

require 'mechanize'
require 'yaml'

class WebLearning
  def initialize(config_file)
    yml = YAML.load_file(config_file)
    yml['user'].each do |name, value|
      instance_variable_set("@#{name}", value)
      self.class.class_eval do 
        attr_accessor name
      end
    end
  end
  def login
    @agent = Mechanize.new
    # Log in
    @agent.post('https://learn.tsinghua.edu.cn/MultiLanguage/lesson/teacher/loginteacher.jsp',
                 {
                  'userid' => @username,
                  'userpass' => @password,
                  'submit1' => '登录'.encode('GBK')
                 })
  end
  def get_course_list
    @agent.get('http://learn.tsinghua.edu.cn/MultiLanguage/lesson/student/MyCourse.jsp?typepage=2') do |courses_page|
      courses_links = courses_page.links.find_all do |link|
        link.attributes['target'] == '_blank'
      end
      return courses_links.map { |link| Course.new(link.to_s.strip, link.attributes['href']) }
    end
  end
end

class Course
  @@instance_id = 0
  def initialize(name, url)
    @course_id = @@instance_id
    @@instance_id += 1
    @course_name, @course_url = name, url    
  end
  attr_accessor :course_id, :course_name, :course_url
end

wl = WebLearning.new('config.yaml')
wl.login()
puts wl.get_course_list().inspect
