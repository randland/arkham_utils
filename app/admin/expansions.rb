ActiveAdmin.register Expansion do
  config.sort_order = :year

  config.clear_sidebar_sections!

  index do
    column 'Icon' do |exp|
      render 'admin/shared/icon_link_to_edit', resource: exp
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
