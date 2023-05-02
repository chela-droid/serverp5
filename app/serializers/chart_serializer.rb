class ChartSerializer < ActiveModel::Serializer
  attributes :id, :name, :sales, :customers
end
