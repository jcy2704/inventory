module SalesHelper
  def sales_group_icon(item)
    if !item.product.group.icon.attached?
      image_tag 'category.svg', class: 'w-100'
    else
      image_tag item.product.group.icon, class: 'w-100'
    end
  end
end
