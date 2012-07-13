Dir[File.expand_path("../../../app/tasks/**/*.rake", __FILE__)].each do |file|
	load file
end