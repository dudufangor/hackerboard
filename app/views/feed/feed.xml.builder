xml.instruct!
# xmlns:dc="http://purl.org/dc/elements/1.1/"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title @question.title
    xml.link question_url(@question)
    xml.language I18n.locale.to_s

    @replies.each do |reply|
      xml.item do
        xml.title t("feed.replied_on", :name => reply.user.name, :time => l(reply.created_at, :format => :short))
        xml.pubDate reply.created_at.strftime("%a, %d %Y %H:%M:%S %z")
        xml.guid question_url(@question, :anchor => "reply-#{reply.id}"), :isPermaLink => true

        xml.author reply.user.name

        xml.description do
          xml.cdata! simple_format(reply.body)
        end
      end
    end
  end
end