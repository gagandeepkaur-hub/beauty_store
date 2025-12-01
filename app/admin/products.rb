ActiveAdmin.register Product do
  permit_params :name, :description, :price, :brand, :category, :on_sale, :new_arrival, :main_image, gallery_images: [], category_ids: []

  index do
    selectable_column
    id_column
    column :name
    column :brand
    column :category
    column :price do |product|
      number_to_currency product.price
    end
    column :on_sale
    column :new_arrival
    actions
  end

  filter :name
  filter :brand
  filter :category
  filter :on_sale
  filter :new_arrival

  form do |f|
    f.inputs 'Product Details' do
      f.input :name
      f.input :description, as: :text
      f.input :price
      f.input :brand
      f.input :category, as: :select, collection: ['Skincare', 'Makeup', 'Haircare', 'Fragrance', 'Body Care', 'Tools & Accessories']
      f.input :categories, as: :check_boxes, collection: Category.all
      f.input :on_sale
      f.input :new_arrival
    end

    f.inputs 'Images' do
      f.input :main_image, as: :file, hint: f.object.main_image.present? ? image_tag(f.object.main_image.variant(:thumb)) : ''
      f.input :gallery_images, as: :file, input_html: { multiple: true }
    end

    f.actions
  end

  show do
    attributes_table do
      row :name
      row :description
      row :price do |product|
        number_to_currency product.price
      end
      row :brand
      row :category
      row :categories do |product|
        product.categories.map(&:name).join(', ')
      end
      row :on_sale
      row :new_arrival
      row :main_image do |product|
        image_tag product.main_image.variant(:medium) if product.main_image.attached?
      end
    end
  end
end