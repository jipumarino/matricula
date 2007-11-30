require File.dirname(__FILE__) + '/../test_helper'
require 'family_groups_controller'

# Re-raise errors caught by the controller.
class FamilyGroupsController; def rescue_action(e) raise e end; end

class FamilyGroupsControllerTest < Test::Unit::TestCase
  def setup
    @controller = FamilyGroupsController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  # Replace this with your real tests.
  def test_truth
    assert true
  end
end
