ActiveAdmin.register Investigator do
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
