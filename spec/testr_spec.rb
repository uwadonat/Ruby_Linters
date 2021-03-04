# test spec/test

require_relative '../lib/my_filereader'
require_relative '../lib/Messages'
describe FileReader do
  let(:line) { FileReader.new }

  # testing check_incomplete_tag method

  describe '#file_display' do
    it 'array of content' do
      expect(line.file_display.class).to eql(Array)
    end
  end

  # testing check_valid_class_name method
      
  describe '#check_valid_class_name' do
    it 'return false and message if classname is not capitalized' do
    expect(line.check_valid_class_name).not_to eql('/A-Z/')
    end

    it 'display type of result' do
    expect(line.check_valid_class_name.class).to eql(Array)
    end
  end

  # testing check_incomplete_tag method

  describe '#check_incomplete_tag' do
    it ' return the missing tag' do
      a = '"'
      expect(line.check_incomplete_tag.include?(a)).not_to eql(true)
    end
  end

  # testing check_space method

  describe '#check_space' do
    it 'return true if any space before or after operator' do
     expect(line.check_space).not_to eql('true')
    end

    it 'display type of result' do
     expect(line.check_space.class).to eql(Array)
    end
  end

  # testing check_line_length method

  describe '#check_line_length' do
    it 'return true with message if line size is greater that 50' do
      expect(line.check_line_length.size).not_to eql(50)
    end
  end
 
  # testing check_empty_line method

  describe '#check_empty_line' do
    it 'return true and display a message when line is empty' do
      expect(line.check_empty_line.empty?).to eql(true)
    end
  end
end
