ActiveAdmin.register Disc do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

    permit_params :make, :model, :disc_type, :plastic, :dc_flight, :nova_speed, :nova_glide, :nova_turn, :nova_fade, :image, disc_plastics_attributes: [:id, :disc_id, :plastic_id, :_destroy]

    form do |f|
        f.semantic_errors *f.object.errors.keys

        f.inputs "Discs" do
            f.input :make
            f.input :model
            f.input :disc_type
            f.has_many :disc_plastics, allow_destroy: true do |n_f|
                n_f.input :plastic
            end
            f.input :dc_flight
            f.input :nova_speed
            f.input :nova_glide
            f.input :nova_turn
            f.input :nova_fade
        end

        f.actions
    end

end
