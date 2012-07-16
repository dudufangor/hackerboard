namespace "app:update_counter_cache" do
  desc "Update all counter caches"
  task :all => [:environment, :questions, :users, :categories]

  desc "Update questions counter cache"
  task :questions do
    update_counters User, :replies
  end

  desc "Update users counter cache"
  task :users do
    update_counters User, :questions, :replies
  end

  desc "Update categories counter cache"
  task :categories do
    update_counters Category, :questions
  end

  def update_counters(model, *counters)
    model.find_each do |record|
      counters.each do |counter|
        model.reset_counters(record.id, counter)
      end
    end
  end
end
