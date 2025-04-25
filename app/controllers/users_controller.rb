class UsersController < ApplicationController

  def index
    matching_users = User.all

    @list_of_users = matching_users.order({ :username => :asc })
    

    render({ :template => "user_templates/index" })

  end

  def show
    url_username = params.fetch("path_username")

    matching_usernames = User.where({ :username => url_username })

    @the_user = matching_usernames.at(0)

    render ({ :template => "user_templates/show" })

  end

  def create
    @the_user = User.new
    @the_user.username = params.fetch("input_username")
    @the_user.save
    redirect_to("/users/#{@the_user.username}")


  end

  def update

    old_name = params.fetch("old_username")

    @updated_user = User.where({ :username => old_name }).at(0)

    new_name = params.fetch("input_username")

    @updated_user.username = new_name

    @updated_user.save
    redirect_to("/users/#{@updated_user.username}")

  end


end
