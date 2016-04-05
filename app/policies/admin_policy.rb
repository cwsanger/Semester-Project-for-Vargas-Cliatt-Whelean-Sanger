class AdminPolicy
  attr_reader :current_member

  def initialize(current_member)
    @current_member = current_member
  end

  def index?
    @current_member.is_a?(Admin)
  end
end
