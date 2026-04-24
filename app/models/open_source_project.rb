class OpenSourceProject < DataModel
  Record = Data.define(:repo, :description, :tags, :role)

  def self.record_class = Record
end
