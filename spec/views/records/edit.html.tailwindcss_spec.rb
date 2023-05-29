require 'rails_helper'

RSpec.describe "records/edit", type: :view do
  let(:record) {
    Record.create!(
      author_id: 1,
      name: "MyString",
      amount: "9.99"
    )
  }

  before(:each) do
    assign(:record, record)
  end

  it "renders the edit record form" do
    render

    assert_select "form[action=?][method=?]", record_path(record), "post" do

      assert_select "input[name=?]", "record[author_id]"

      assert_select "input[name=?]", "record[name]"

      assert_select "input[name=?]", "record[amount]"
    end
  end
end
