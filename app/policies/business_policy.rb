class BusinessPolicy
  attr_reader :current_member, :business

  def initialize(current_member, business)
    @current_member = current_member
    @business = business
  end

  def show?
    @current_member.is_a?(Business) and (@current_member.id == @business.id)
  end
end
