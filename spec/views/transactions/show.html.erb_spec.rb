require 'rails_helper'

RSpec.describe 'transactions/show', type: :view do
  before(:each) do
    assign(:transaction, Transaction.create!(
                           name: 'Name',
                           amount: '9.99',
                           category: 'Category',
                           user: nil
                         ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/Category/)
    expect(rendered).to match(//)
  end
end
