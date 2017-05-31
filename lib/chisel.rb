require 'pry'

def convert_text(incoming_text)
  incoming_text.each_line do |line|
    new_line = ''
    if line.include? '#'
      new_line = heading_line(line)
    end
    html_file.write(new_line)
  end
end

def heading_line(line)
  if line.include? '##'
    line.delete('#')
    return "<h2> #{line} </h2>"
  elsif line.include? '###'
    line.delete('#')
    return "<h3> #{line} </h3>"
  else
    line.delete('#')
    return "<h1> #{line} </h1>"
  end
end

markdown_file = File.open(ARGV[0], 'r')
incoming_text = markdown_file.read
html_file = File.open(ARGV[1], 'w')
convert_text(incoming_text)
