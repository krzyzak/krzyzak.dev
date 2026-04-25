class Service < DataModel
  Record = Data.define(:title, :description)

  def self.record_class = Record
end
