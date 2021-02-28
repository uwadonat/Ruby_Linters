# class for error messages
class Messages
  attr_reader :bad_filename, :empty_line, :space_operator, :class_name_error

  def initialize
      @bad_filename = 'Use Snake case format to file name.'
      @empty_line = 'there empty line at line'
      @space_operator = 'use space before and after operator'
      @class_name_error = 'use Camel Case format for class Name.'
  end
end
