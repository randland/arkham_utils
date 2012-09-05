ActiveAdmin.register Investigator do
  controller do
    def scoped_collection
      end_of_association_chain.order :name
    end
  end

  index do
    column 'Expansion' do |inv|
      if inv.expansion.present?
        link_to image_tag(inv.expansion.icon.url(:thumb),
                          title: inv.expansion.name),
                admin_expansion_path(inv.expansion)
      end
    end
    column :name
    column :occupation
    column :sanity
    column :stamina
    column :focus
    default_actions
  end
end
