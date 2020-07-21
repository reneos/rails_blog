class PostPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(is_published: true)
    end

    def resolve_dashboard
      if user.admin?
        scope.all
      else
        scope.where(user: user)
      end
    end
  end

  def new?
    true
  end

  def create?
    new?
  end

  def edit?
    owner_or_admin?
  end

  def update?
    owner_or_admin?
  end

  def destroy?
    owner_or_admin?
  end

  def publish?
    owner_or_admin?
  end

  def unpublish?
    owner_or_admin?
  end

  def show?
    record.published? || record.user == user
  end

  private

  def owner_or_admin?
    record.user == user || user.admin?
  end
end
