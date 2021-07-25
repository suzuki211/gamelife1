class ApplicationController < ActionController::Base

  def after_sign_in_path_for(resource)
    case resource
      when Admin
        admin_genres_path
      when User
        user_games_path
    end
  end
end