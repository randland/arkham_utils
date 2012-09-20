ActiveAdmin.register Investigator do
  config.sort_order = :name

  index do
    column 'Expansion' do |inv|
      render 'admin/shared/icon_link', resource: inv.expansion if inv.expansion.present?
    end
    column :name
    column :occupation
    column :sanity
    column :stamina
    column :focus
    default_actions
  end
end
