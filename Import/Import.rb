# encoding: utf-8

require "roo"
require "json"

doc = Excelx.new("Import.xlsx")

json = Hash.new
authors = Hash.new
section = ""
date = ""
sectionId = 0;

doc.default_sheet = doc.sheets[1]
4.upto(doc.last_row) do |line|
  author = doc.cell(line, 'A') ? doc.cell(line, 'A') : ""
  authors[author] = Hash.new();
  authors[author] = {
    :author => author,
    :position => doc.cell(line, 'B') ? doc.cell(line, 'B') : "",
    :company => doc.cell(line, 'C') ? doc.cell(line, 'C') : "",
    :description => doc.cell(line, 'D') ? doc.cell(line, 'D').gsub("\n", '\\n') : "",
    :picture => doc.cell(line, 'E') ? "#{doc.cell(line, 'E')}.jpg" : ""
  }
end

doc.default_sheet = doc.sheets[0]
5.upto(doc.last_row) do |line|
  section = doc.cell(line, 'B') ? doc.cell(line, 'B') : section

  date = doc.cell(line, 'A') ? doc.cell(line, 'A') : date
  start = doc.cell(line, 'C')
  duration = doc.cell(line, 'D')
  
  date_start = Time.parse("#{date} #{start}").to_time.to_i
  if duration
    date_end = date_start + duration.split(':')[0].to_i*3600 + duration.split(':')[1].to_i*60
  else
    date_end = date_start
  end

  author = doc.cell(line, 'E') ? doc.cell(line, 'E') : ""
  position = doc.cell(line, 'F') ? doc.cell(line, 'F') : ""
  company = doc.cell(line, 'G') ? doc.cell(line, 'G') : ""
  title = doc.cell(line, 'H') ? doc.cell(line, 'H').gsub("\n", '\\n') : ""
  description = doc.cell(line, 'I') ? doc.cell(line, 'I').gsub("\n", '\\n') : ""
  
  if author && start    
    if !json[date]
      json[date] = {
        :sections => Hash.new,
        :schedule => Hash.new
      }
    end
    
    if !json[date][:sections].values.any?{|v| v == section }
      sectionId = json[date][:sections].length+1;
      json[date][:sections][sectionId] = section
      json[date][:schedule][sectionId] = Array.new
    end

    json[date][:schedule][sectionId].push(
      :section => section,
      :start => date_start,
      :end => date_end,
      :author => author,
      :position => position,
      :company => company,
      :title => title,
      :description => description
    )    
  end
end

out = Hash.new
out[:data] = json
out[:authors] = authors
out = out.to_json.gsub('\\"', '″').gsub('"', '\\"')
File.open("../Bank/Data/Data.m", "w") {|f| f.write("NSString * const DATA = @\"#{out}\";") }
#puts json