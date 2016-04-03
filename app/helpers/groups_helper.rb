module GroupsHelper
  def not_users(group)
    group.neighborhood.users - group.users
  end
end
