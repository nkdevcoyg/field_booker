ActiveAdmin.register Field do
  permit_params :title, :location, :price, :size, :field_coverage
end