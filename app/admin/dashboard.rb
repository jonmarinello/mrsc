ActiveAdmin.register_page 'Dashboard' do

  menu priority: 1, label: proc { I18n.t('active_admin.dashboard') }

  content title: proc { I18n.t('active_admin.dashboard') } do
    columns do
      column do
        panel 'Potential Projects Metrics', id: 'key_metrics_panel' do
          h4 do
            ul do
              li "Active: #{number_with_delimiter(PotentialProject.active.count)}"
              li "Total: #{number_with_delimiter(PotentialProject.all.count)}"
            end
          end
        end
      end
      column do
        panel 'Recommendation Metrics', id: 'key_metrics_panel' do
          h4 do
            ul do
              li "Total: #{number_with_delimiter(Recommendation.all.count)}"
            end
          end
        end
      end
    end

    # Here is an example of a simple dashboard with columns and panels.
    #
    # columns do
    #   column do
    #     panel "Recent Posts" do
    #       ul do
    #         Post.recent(5).map do |post|
    #           li link_to(post.title, admin_post_path(post))
    #         end
    #       end
    #     end
    #   end

    #   column do
    #     panel "Info" do
    #       para "Welcome to ActiveAdmin."
    #     end
    #   end
    # end
  end # content
end
