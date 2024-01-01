RailsAdmin.config do |config|
  config.asset_source = :sprockets

  ## Devise
  config.authenticate_with do
    warden.authenticate! scope: :user
  end
  config.current_user_method(&:current_user)

  ## CancanCan
  config.authorize_with :cancancan

  # Uncomment the following block if you want to restrict access
  # config.authorize_with do
  #   redirect_to main_app.root_path unless current_user && (current_user.super_admin? || current_user.admin?)
  # end

  ## Pundit
  # config.authorize_with :pundit

  ## PaperTrail
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ## More at https://github.com/railsadminteam/rails_admin/wiki/Base-configuration

  ## Gravatar integration
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar = true

  config.model 'User' do
    edit do
      field :password do
        help 'Leave it blank if you do not want to change the password'
        required false
      end
      field :password_confirmation do
        required false
      end
      field :custom_order
    end
  end

  config.actions do
    dashboard
    index
    new
    export
    bulk_delete
    show
    edit
    delete

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
end
