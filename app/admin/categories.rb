ActiveAdmin.register Category do
  permit_params :name, :description

  index do
    selectable_column
    id_column
    column :name
    column :description
    column :products_count do |category|
      category.products.count
    end
    actions
  end

  form do |f|
    f.inputs 'Category Details' do
      f.input :name
      f.input :description, as: :text
    end
    f.actions
  end
end