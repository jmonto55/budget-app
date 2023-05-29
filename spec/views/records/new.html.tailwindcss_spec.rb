require 'rails_helper'

RSpec.describe "records/new", type: :view do
  before(:each) do
    assign(:record, Record.new(
      author_id: 1,
      name: "MyString",
      amount: "9.99"
    ))
  end

  it "renders new record form" do
    render

    assert_select "form[action=?][method=?]", records_path, "post" do

      assert_select "input[name=?]", "record[author_id]"

      assert_select "input[name=?]", "record[name]"

      assert_select "input[name=?]", "record[amount]"
    end
  end
end
