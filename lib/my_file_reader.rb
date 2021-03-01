# require_relative 'my_file_checker'
# require_relative 'messages'
# require_relative 'my_file
require 'colorize'
# File reader class

class File_reader
     attr_reader :counter, :each_line, :file_path, :all_file, :check, :class_name
   # call external class
   
   def initialize
      @counter = 0
      @each_line = []
      @file_path = []
      @all_file = []
      @class_name = []
   end
   
   def file_reader
    @file_path = File.open("../my_file.rb", "r") do |file|
        until counter >= file.size 
           @each_line = file.readline()
           @all_file << @each_line          
           @counter += 1
        end
       rescue EOFError
       end
   end
   
   def display
    puts "file to be checked is:".colorize(:light_yellow)
    puts "-------------------------------------"
    file_display
    puts "-------------------------------------"
    puts "let's check file line by line".colorize(:light_yellow)
    check_valid_class_name
    check_undefined_variables
    check_space
    check_incomplete_tag
   end

   def file_display
    file_reader
    puts @all_file
   end

   # check if class name is valid

   def check_valid_class_name
    file_reader
    @all_file.each_with_index do |line, index|
      if line.strip.split(' ').first.eql?('class')
        @class_name = line.strip.split(' ')[1]
        if @class_name.capitalize!
        puts "line:#{index + 1}: class name must be capitalized. change to: #{@class_name.colorize(:light_red)}" 
        else
          puts "no offences found".colorize(:blue)
        end
      end
    end
    @all_file = []
   end

   # check space before and after operator

   def check_space
    file_reader
      @all_file.each_with_index do |line, index|
         
         if line =~  /\w\+/
          puts "line:#{index + 1}:" + "put space before operator".colorize(:light_red)
         elsif line =~ /\+\w/
          puts "line:#{index + 1}:" + "put space after operator".colorize(:light_red)
         elsif line =~ /=\w/
          puts "line:#{index + 1}:" + "put space after operator".colorize(:light_red)
         elsif line =~ /\w=/
          puts "line:#{index + 1}:" + "put space before operator".colorize(:light_red)
           end
        end
   end


   def check_undefined_variables
    file_reader
    @all_file.each_with_index do |line, index|
      if line.strip.split(' ').include?('+')
        after = line.strip.split(' ')[2]
        if after.match?(/[A-Za-z]/) && !defined?(after)
        puts "you are done"
        # puts "line:#{index + 1}: class name must be capitalized. change to: #{@class_name.colorize(:light_red)}" 
        else
          puts "no offences found".colorize(:blue)
        end
      end
    end
    @all_file = []
   end

   def check_incomplete_tag
    @all_file.each_with_index do |line, index|
      if  line =~  /'\w/ 
         puts "line:#{index + 1}:" + "incomplete tag found".colorize(:light_red) unless line =~  /\w'/ 
      end
      if  line =~  /"\w/ 
        puts "line:#{index + 1}:" + "incomplete tag found".colorize(:light_red) unless line =~  /\w'/ 
     end
     if  line =~  /\w'/ 
      puts "line:#{index + 1}:" + "incomplete tag found".colorize(:light_red) unless line =~  /'\w/ 
   end
   if  line =~  /\w"/ 
     puts "line:#{index + 1}:" + "incomplete tag found".colorize(:light_red) unless line =~  /'\w/ 
  end
     
    end
   end


   

   




end
