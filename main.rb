require 'fileutils'
require 'date'

$period_end_file = "period_end.txt"
$eval_keys = "~/.RubyMine*/config/eval/*"
$other_xml = "~/.RubyMine*/config/options/other.xml"
$rubymine_directory = "~/.java/.uderPrefs/jetbrains/rubymine/"
$new_date = (Date.today+24).strftime "%d/%m/%Y"

def clear_eval
  FileUtils.rm_rf(Dir.glob($eval_keys))
end

def remove_other_xml
  FileUtils.rm_rf($other_xml)
end

def clear_rubymine
  FileUtils.rm_rf($rubymine_directory)
end

def reset_date
  File.write($period_end_file, $new_date)
end

date_end = File.open($period_end_file, &:read)
if (Date.today.strftime "%d/%m/%Y\n") == date_end
  clear_eval
  remove_other_xml
  clear_rubymine
  reset_date
end
