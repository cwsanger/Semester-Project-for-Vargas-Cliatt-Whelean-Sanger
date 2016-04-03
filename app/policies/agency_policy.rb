class AgencyPolicy
  attr_reader :current_member, :agency

  def initialize(current_member, agency)
    @current_member = current_member
    @agency = agency
  end

  def show?
    @current_member.is_a?(Agency) and (@current_member.id == agency.id)
  end
end
