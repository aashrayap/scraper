require 'mechanize'

scraper= Mechanize.new
scraper.history_added = Proc.new { sleep 0.5 }

page=scraper.get("http://www.dice.com/")
result=page.form_with(:id=>'search-form')
result.q='engineer internship'

page = scraper.submit(result)

pp page


