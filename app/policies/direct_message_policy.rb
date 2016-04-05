class DirectMessagePolicy
  def initialize(current_member, to_user)
    @current_member = current_member
    @to_user = to_user
  end

  def show?
    @current_member.is_a?(User) and
      (@current_member.neighborhood.id == @to_user.neighborhood.id)
  end
end
