class GroupPolicy
  attr_reader :current_member, :group

  def initialize(current_member, group)
    @current_member = current_member
    @group = group
  end

  def show?
    @current_member.is_a?(User) and @current_member.is_in_group?(@group)
  end

  def index?
    @current_member.is_a?(User)
  end
end
