class Experience < DataModel
  Record = Data.define(:company, :role, :description, :featured)

  def self.record_class = Record
end
