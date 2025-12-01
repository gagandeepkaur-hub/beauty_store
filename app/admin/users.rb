ActiveAdmin.register User do
  permit_params :email, :first_name, :last_name

  index do
    selectable_column
    id_column
    column :email
    column :first_name
    column :last_name
    column :orders_count do |user|
      user.orders.count
    end
    actions
  end

  show do
    attributes_table do
      row :email
      row :first_name
      row :last_name
    end

    panel "Orders" do
      table_for user.orders do
        column "Order" do |order|
          link_to "##{order.id}", admin_order_path(order)
        end
        column :status do |order|
          status_tag order.status
        end
        column :total do |order|
          number_to_currency order.total
        end
        column :created_at
      end
    end
  end
end