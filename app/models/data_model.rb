class DataModel
  def self.all
    @all ||= YAML.safe_load_file(data_path, symbolize_names: true).map { |attrs| record_class.new(**attrs) }
  end

  def self.data_path
    Rails.root.join("config/data/#{name.underscore.pluralize}.yml")
  end

  def self.record_class
    raise NotImplementedError, "#{name} must define record_class"
  end
end
