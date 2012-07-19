Category.to_be_removed.find_each do |category|
  Rails.logger.info "Removing category: #{category.name}"
  category.destroy
end
