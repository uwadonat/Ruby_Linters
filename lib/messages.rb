# class for error messages
class Messages
  attr_reader :bad_classname, :empty_line, :line_length, :incomplete_tag

  def initialize
    @bad_classname = 'class name must be capitalized.'
    @empty_line = 'this is an extra empty line.'
    @incomplete_tag = 'there is incomplete tag on this line'
    @line_length = ' line must contain not more than 30 character'
  end
end
