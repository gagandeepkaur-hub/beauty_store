ActiveAdmin.register Order do
  permit_params :status

  index do
    selectable_column
    id_column
    column :user
    column :status do |order|
      status_tag order.status
    end
    column :total do |order|
      number_to_currency order.total
    end
    column :created_at
    actions
  end

  filter :user
  filter :status
  filter :created_at

  show do
    attributes_table do
      row :user
      row :status do |order|
        status_tag order.status
      end
      row :subtotal do |order|
        number_to_currency order.subtotal
      end
      row :tax do |order|
        number_to_currency order.tax
      end
      row :total do |order|
        number_to_currency order.total
      end
      row :shipping_address do |order|
        "#{order.shipping_street}, #{order.shipping_city}, #{order.shipping_province_name} #{order.shipping_postal_code}"
      end
    end

    panel "Order Items" do
      table_for order.order_items do
        column :product
        column :quantity
        column :price do |item|
          number_to_currency item.price
        end
        column :subtotal do |item|
          number_to_currency item.subtotal
        end
      end
    end
  end

  form do |f|
    f.inputs 'Order Status' do
      f.input :status, as: :select, collection: Order.statuses_for_select
    end
    f.actions
  end
end