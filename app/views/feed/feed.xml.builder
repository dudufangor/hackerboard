xml.instruct!

xml.channel do
	xml.title @question.title
	xml.link question_url(@question)
	xml.language I18n.locale

	@replies.each do |reply|
		xml.item do
			xml.title
			xml.pubDate
			xml.tag!("dc:creator") { reply.user.name }
		end
	end
end