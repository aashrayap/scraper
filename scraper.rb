require 'mechanize'
require 'pry'

Job=Struct.new(:title,:company,:link)
jobarray=[]

scraper= Mechanize.new
scraper.history_added = Proc.new { sleep 0.5 }

page=scraper.get("http://www.dice.com/")
result=page.form_with(:id=>'search-form')
result.q='engineer internship'

page = scraper.submit(result)

page.links_with(:href => /detail/).each do |link|

  current_job=Job.new
  current_job.title=link.text.strip

  description_page=link.click
  holder =description_page.link_with(:href => /company/) 
  current_job.company=holder.text
  current_job.link=link
  jobarray<<current_job

end



