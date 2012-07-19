class QuestionSearch
  def self.page_size
    Paginate::Config.size + 1
  end

  def self.search(options)
    Question.search(options[:query], {
      :page => options[:page],
      :per_page => page_size
    })
  end
end
