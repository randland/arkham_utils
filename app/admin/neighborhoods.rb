ActiveAdmin.register Neighborhood do
  controller do
    def scoped_collection
      end_of_association_chain.with_associations
    end
  end

  config.clear_sidebar_sections!

  index do
    column 'Expansion', sortable: :'expansions.year' do |nbhd|
      render 'admin/expansions/icon_link', expansion: nbhd.expansion
    end
    column :name
    default_actions
  end
end
