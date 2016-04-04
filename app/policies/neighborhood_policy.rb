class NeighborhoodPolicy
  attr_reader :current_member, :neighborhood

  def initialize(current_member, neighborhood)
    @current_member = current_member
    @neighborhood = neighborhood
  end

  def show?
    @current_member.is_a?(User) and (@current_member.neighborhood.id == neighborhood.id)
  end
end
