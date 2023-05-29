require 'rails_helper'

RSpec.describe "records/show", type: :view do
  before(:each) do
    assign(:record, Record.create!(
      author_id: 2,
      name: "Name",
      amount: "9.99"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/9.99/)
  end
end
