ActiveAdmin.register App do
  member_action :publish, :method => :get do
    app = App.find params[:id]
    app.publish!

    flash[:notice] = "App has been published"
    redirect_to [:admin, app]
  end

  action_item :only => :show do
    if !app.published
      link_to("Publish", publish_admin_app_path(app), :method => :get)
    end
  end

end
