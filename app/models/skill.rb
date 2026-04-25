class Skill < DataModel
  Record = Data.define(:name, :description, :style)

  def self.record_class = Record
end
