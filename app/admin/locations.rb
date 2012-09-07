ActiveAdmin.register Location do
  config.sort_order = :name

  controller do
    def scoped_collection
      end_of_association_chain.includes [:neighborhood, :expansion, :encounter_type_1, :encounter_type_2]
    end

    def create
      create! do |format|
        format.html { redirect_to new_admin_location_url }
      end
    end

    def update
      update! do |format|
        format.html { redirect_to admin_locations_url }
      end
    end
  end

  form do |f|
    f.inputs "Details" do
      f.input :name
      f.input :neighborhood
      f.input :stable
      f.input :encounter_type_1
      f.input :encounter_type_2
    end
    f.buttons
  end

  index do
    column 'Expansion', sortable: :'expansions.year' do |location|
      render 'admin/expansions/icon_link', expansion: location.expansion
    end
    column 'Name', sortable: :name do |location|
      link_to location.name, admin_location_path(location)
    end
    column 'Neighborhood', sortable: :'neighborhoods.name' do |location|
      neighborhood = location.neighborhood
      link_to neighborhood.name, admin_neighborhood_path(neighborhood)
    end
    column 'Stability', sortable: :stable do |location|
      image_tag("#{location.stable ? '' : 'un'}stableIcon.png")
    end
    column 'Encounter Types' do |location|
      location.encounter_types.map do |encounter_type|
        link_to image_tag(encounter_type.icon.url(:thumb),
                          title: encounter_type.name),
                admin_encounter_type_path(encounter_type)
      end.join.html_safe
    end
    default_actions
  end
end
