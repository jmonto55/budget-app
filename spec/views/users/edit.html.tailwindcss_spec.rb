require 'rails_helper'

RSpec.describe "users/edit", type: :view do
  let(:user) {
    User.create!()
  }

  before(:each) do
    assign(:user, user)
  end

  it "renders the edit user form" do
    render

    assert_select "form[action=?][method=?]", user_path(user), "post" do
    end
  end
end
