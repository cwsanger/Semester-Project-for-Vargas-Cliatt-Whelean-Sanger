module CurrentGroups
  extend ActiveSupport::Concern

  private
    def set_groups
      @groups = @current_member.groups
    end
end
