ActiveAdmin.register DimensionalSymbol do
  menu false

  config.sort_order = :name

  config.clear_sidebar_sections!

  index do
    column 'Icon' do |symbol|
      render 'admin/shared/icon_link_to_edit', resource: symbol
    end
    column 'Name', sortable: :name do |symbol|
      link_to symbol.name, admin_dimensional_symbol_path(symbol)
    end
    default_actions
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :icon, as: :file, :hint => f.template.image_tag(f.object.icon.url :thumb)
    end
    f.buttons
  end
end
