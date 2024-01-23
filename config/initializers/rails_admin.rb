RailsAdmin.config do |config|
  config.asset_source = :sprockets

  ## Devise
  config.authenticate_with do
    warden.authenticate! scope: :user
  end
  config.current_user_method(&:current_user)

  ## CancanCan
  config.authorize_with :cancancan

  config.model 'User' do
    edit do
      configure :super_admin do
        visible do
          user = bindings[:controller].current_user
          user.super_admin?
        end
        required do
          user = bindings[:controller].current_user
          user.admin?
        end
      end

      configure :admin do
        visible do
          user = bindings[:controller].current_user
          user.super_admin?
        end
      end

      configure :departments do
        visible do
          user = bindings[:controller].current_user
          user.super_admin?
        end
      end
      configure :reset_password_sent_at do
        visible do
          user = bindings[:controller].current_user
          user.super_admin?
        end
      end

      configure :created_at do
        visible do
          user = bindings[:controller].current_user
          user.super_admin?
        end
      end

      configure :remember_created_at do
        visible false
      end

      configure :reset_password_token do
        visible false
      end
      configure :email
      configure :password
      configure :password_confirmation
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
