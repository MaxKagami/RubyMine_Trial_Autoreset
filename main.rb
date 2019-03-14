require 'fileutils'
require 'date'

period_end_file = 'period_end.txt'
eval_keys = '/.RubyMine*/config/eval/*'
other_xml = '/.RubyMine*/config/options/other.xml'
rubymine_directory = '/.java/.userPrefs/jetbrains/rubymine/'
new_date = (Date.today+23).strftime "%d/%m/%Y"

date_end = File.open(period_end_file, &:read)
if (Date.today.strftime "%d/%m/%Y\n") == date_end
  FileUtils.rm_rf(Dir[ENV['HOME']+eval_keys])
  FileUtils.rm_rf(Dir[ENV['HOME']+other_xml])
  FileUtils.rm_rf(Dir[ENV['HOME']+rubymine_directory])
  File.write(period_end_file, new_date)
end
