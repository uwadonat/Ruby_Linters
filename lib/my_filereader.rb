# require_relative 'messages'
require 'colorize'
class FileReader
  attr_reader :counter, :each_line, :file_path, :all_file, :class_name, :mess, :no_offence

  def initialize
    @counter = 0
    @no_offence = 0
    @each_line = []
    @file_path = []
    @all_file = []
    @class_name = []
    @mess = Messages.new
  end

  def filereader
    @file_path = File.open('../my_file.rb', 'r') do |file|
      begin until counter >= file.size
              @each_line = file.readline
              @all_file << @each_line
              @counter += 1
            end
      rescue EOFError
        @file_lines = []
      end
    end
  end

  def display
    puts 'file to be checked is:'.colorize(:light_yellow)
    puts '-------------------------------------'
    file_display
    puts '-------------------------------------'
    puts "let's check file line by line".colorize(:light_yellow)
    puts '-------------------------------------'
    check_valid_class_name
    check_space
    check_incomplete_tag
    check_line_length
    check_empty_line
    offences
  end

  def file_display
    filereader
    puts @all_file
    @file_lines = []
  end
  # check if class name is valid

  def check_valid_class_name
    @all_file.each_with_index do |line, index|
      next unless line.strip.split(' ').first.eql?('class')

      @class_name = line.strip.split(' ')[1]
      puts "line:#{index + 1}: #{@mess.bad_classname.colorize(:light_red)} Change to: #{@class_name.colorize(:light_blue)}" if @class_name.capitalize! && index <= counter
    end
    @all_file = []
  end

  # check space before and after operator

  def check_space
    filereader
    @all_file.each_with_index do |line, index|
      case line
      when /\w\+/
        puts "line:#{index + 1}:" + 'put space before operator'.colorize(:light_red)

      when /\+\w/
        puts "line:#{index + 1}:" + 'put space after operator'.colorize(:light_red)

      when /=\w/
        puts "line:#{index + 1}:" + 'put space after operator'.colorize(:light_red)

      when /\w=/
        puts "line:#{index + 1}:" + 'put space before operator'.colorize(:light_red)
      end
    end
    @file_lines = []
  end

  # check for incomplete tags
  def check_incomplete_tag
    @all_file.each_with_index do |line, index|
      puts "line:#{index + 1}:" + @mess.incomplete_tag.to_s.colorize(:light_red) if line =~ /'\w/ && line !~ /\w'/
      puts "line:#{index + 1}:" + @mess.incomplete_tag.to_s.colorize(:light_red) if line =~ /"\w/ && line !~ /\w"/
      puts "line:#{index + 1}:" + @mess.incomplete_tag.to_s.colorize(:light_red) if line =~ /\w'/ && line !~ /'\w/
      puts "line:#{index + 1}:" + @mess.incomplete_tag.to_s.colorize(:light_red) if line =~ /\w"/ && line !~ /"\w/
    end
    @file_lines = []
  end

  # check over limit lines
  def check_line_length
    sum = 0
    @all_file.each_with_index do |line, index|
      a = line.strip.split(' ')
      a.each do |x|
        s = x.split('').size
        sum += s
        puts "line:#{index + 1}:#{@mess.line_length.colorize(:light_red)}" if sum >= 50
      end
      sum = 0
    end
    @all_file = []
  end

  # check  empty line

  def check_empty_line
    line_counter = 0
    filereader
    @all_file.each_with_index do |line, index|
      a = line.strip.split(' ')
      if a.size.zero? && index.zero?
        puts "line:#{index + 1}:#{@mess.empty_line.colorize(:light_red)}" + ' Remove it'.colorize(:light_blue)

      elsif a.size.zero?
        line_counter += 1
        if line_counter >= 2
          puts "line:#{index + 1}:#{@mess.empty_line.colorize(:light_red)}" + ' Remove it'.colorize(:light_blue)
          line_counter = 0
        end
      end
    end
    @all_file = []
  end

  def offences
    puts 'no other offences found'.colorize(:light_blue)
  end
end
