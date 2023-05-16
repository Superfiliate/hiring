require 'rails_helper'

RSpec.describe CartsController, type: :controller do
  describe 'post' do
    let(:params) {{ cart: {reference: '', lineItems: []} }}
    let(:subject) do
      post :create, params: params, format: :json
    end

    let(:expect_response) do
      {
        'data' => {
          'attributes' => {
            'final_price' => 0.0, 'line_items' => [], 'reference' => ''
          }, 'id' => nil, 'relationships' => { 'line_items' => {'data' => []} },
          'type' => 'cart_service'
        }
      }
    end

    it 'returns 200 ok' do
      expect(subject).to have_http_status(:ok)
    end

    specify do
      expect(JSON.parse(subject.body)).to eq(expect_response)
    end

    context 'when params is blank' do
      let(:params) {}

      it 'returns 400 ok' do
        expect(subject).to have_http_status(:bad_request)
      end
    end
  end
end
