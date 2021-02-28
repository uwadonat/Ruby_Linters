require_relative 'my_file_reader'
require_relative 'messages'
class Checkers
  attr_reader :line, :source, :error

  def initialize()
    @error = []
    @error_message = Messages.new
    @snake_case = /^[a-z]+_+([:lower:]+)*/
    @camel_case = /^[A-Z]\w+(?:[A-Z]\w+){1,}/
  end

  def class_name_valid?(*)
    @source.each_with_index do |line, index|
      if line.strip.split(' ').first.eql?('class')
        class_name = line.strip.split(' ')[1]
        @error << "line:#{index + 1}: #{@error_message.class_name}" unless !class_name.match?(/_/) && name_val.match?(@camel_case)
      end
    end
  end


end
