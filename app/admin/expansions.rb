ActiveAdmin.register Expansion do
  menu

  index do
    column '' do |exp|
      link_to image_tag(exp.icon.url :thumb), admin_expansion_path(exp) if exp.icon.present?
    end
    column 'Name', sortable: :name do |exp|
      link_to exp.name, admin_expansion_path(exp)
    end
    column :year
    default_actions
  end
end
