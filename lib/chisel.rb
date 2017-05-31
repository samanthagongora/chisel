def convert_file(incoming_text, html_file)
  incoming_text.each_line do |line|
    new_line = convert_line(line)
    write_to_file(html_file, new_line)
  end
end

def convert_line(line)
  new_line = ''
  if line.include? '#'
    return new_line = heading_line(line)
  # elsif line.include? '*'
  #   return new_line = emp_line(line)
  else
    return new_line = paragraph_line(line)
  end
  new_line
end

def heading_line(line)
  line = line.chomp
  if line.include? '##'
    line.delete!'# '
    return "<h2>#{line}</h2>\n"
  elsif line.include? '###'
    line.delete!'# '
    return "<h3>#{line}</h3>"
  else
    line.delete!'# '
    return "<h1>#{line}</h1>\n"
  end
end

# def emp_line(line)
#   emp_counter = 0
#   chars = line.split('')
#
#   chars.each_with_index do |char, idx|
#     if char == '*' && chars[idx + 1] == '*'
#
#
# end

def paragraph_line(line)
  "<p>#{line}</p>"
end

def write_to_file(html_file, new_line)
  html_file.write(new_line)
end

markdown_file = File.open(ARGV[0], 'r')
incoming_text = markdown_file.read
html_file = File.open(ARGV[1], 'w')
convert_file(incoming_text, html_file)
