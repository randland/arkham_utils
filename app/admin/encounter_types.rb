ActiveAdmin.register EncounterType do
  menu false

  config.clear_sidebar_sections!

  index do
    column 'Icon', sortable: :'expansions.year' do |expansion|
      render 'admin/expansions/icon_link', expansion: expansion
    end
    column 'Name', sortable: :name do |encounter_type|
      link_to encounter_type.name, admin_encounter_type_path(encounter_type)
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
