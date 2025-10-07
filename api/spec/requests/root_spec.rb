require 'rails_helper'

RSpec.describe 'Root path', type: :request do
  it 'responds successfully' do
    get '/'
    expect(response).to have_http_status(:ok)
  end
end
