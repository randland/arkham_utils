ActiveAdmin.register Expansion do
  config.clear_sidebar_sections!

  index do
    column 'Icon' do |exp|
      link_to image_tag(exp.icon.url :thumb), admin_expansion_path(exp) if exp.icon.present?
    end
    column 'Name', sortable: :name do |exp|
      link_to exp.name, admin_expansion_path(exp)
    end
    column :year
    default_actions
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :year
      f.input :big_box
      f.input :icon, as: :file, :hint => f.template.image_tag(f.object.icon.url :thumb)
    end
    f.buttons
  end
end
