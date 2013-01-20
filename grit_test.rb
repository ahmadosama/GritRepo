require "rubygems"
require "grit"

location = 'D:\GritRepo'
#repo = Grit::Repo.init(location)
repo=Grit::Repo.new(location)
changed_files = repo.status.files.select { |k,v| (v.type =~ /(M|A)/ || v.untracked) }
Dir.chdir(location) {
changed_files.each do |changed_file|
# changed_file here is array, which first element is name of file 
# e.g. changed_file.first => "example.txt."
repo.add(changed_file.first)
end
}
repo.commit_index("Successful commit! yeeeee! ")

