require 'rubimas'

(1..50).each do |num|
  FileUtils.touch(File.dirname(__FILE__) + ("/config/idols/%02d_%s.yml" % [num, Rubimas.find(num).key]))
end
