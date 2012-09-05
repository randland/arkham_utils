ActiveAdmin.register Neighborhood do
  controller do
    def scoped_collection
      end_of_association_chain.order :expansion_id, :name
    end
  end

  config.clear_sidebar_sections!

  index do
    column 'Expansion' do |nbhd|
      if nbhd.expansion.present?
        link_to image_tag(nbhd.expansion.icon.url(:thumb),
                          title: nbhd.expansion.name),
                admin_expansion_path(nbhd.expansion)
      end
    end
    column :name
    default_actions
  end
end
