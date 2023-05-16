require 'rails_helper'

RSpec.describe V1::CartService do
  describe 'create' do
    subject { JSON.parse(described_class.create(payload)) }

    let(:line_items) do
      [
        # { name: "Peanut Butter", price: "39.0", collection: "BEST'SELLERS'},
        # { name: "Banana Cake", price: "34.99", collection: 'DEFAULT'},
        { name: 'Cocoa', price: '34.99', collection: 'KETO'},
        # { name: "Fruity", price: "32", collection: 'DEFAULT'}
      ]
    end
    let(:reference) { '2d832fe0-6c96-4515-9be74c00983539c1'}
    let(:payload) do
      {
        reference: reference,
        lineItems: line_items
      }
    end

    context 'when cart does not have promotion itens' do
      let(:expect_response) do
        {
          'data'=> {
            'attributes'=> {
              'final_price' => 34.99,
              'line_items'=> [
                { 'collection'=> 'KETO', 'discount'=> 0, 'final_price'=> 34.99, 'id'=> 1, 'name'=> 'Cocoa', 'price'=> 34.99,
                  'with_discount'=> false
                }],
              'reference'=> reference
            },
            'id'=> nil,
            'relationships'=> {
              'line_items'=> { "data"=> [{ 'id'=> "1", 'type'=> 'cart_item_service' }] }
            }, 'type'=> "cart_service"
          }
        }
      end

      specify do
        expect(subject).to eq(expect_response)
      end
    end

    context 'when cart has 2 promotions itens' do
      let(:line_items) do
        [
          { name: 'Peanut Butter', price: '20.0', collection: "BEST-SELLERS"},
          { name: 'Banana Cake', price: '15.40', collection: 'DEFAULT'},
          { name: 'Cocoa', price: '9.99', collection: 'KETO'},
        ]
      end

      let(:expect_response) do
        {
          'data'=> {
            'attributes'=> {
              'final_price' => 43.62,
              'line_items'=> [
                { 'collection'=> line_items[0][:collection], 'discount'=> 5, 'final_price'=> 19.0, 'id'=> 1, 'name'=> line_items[0][:name], 'price'=> 20.0,
                  'with_discount'=> true
                },
                { 'collection'=> line_items[1][:collection], 'discount'=> 5, 'final_price'=> 14.63, 'id'=> 2, 'name'=> line_items[1][:name], 'price'=> 15.4,
                  'with_discount'=> true
                },
                { 'collection'=> line_items[2][:collection], 'discount'=> 0, 'final_price'=> 9.99, 'id'=> 3, 'name'=> line_items[2][:name], 'price'=> 9.99,
                  'with_discount'=> false
                }
              ],
              'reference'=> reference
            },
            'id'=> nil,
            'relationships'=> {
              'line_items'=> { 'data' => [
                { 'id'=> '1', 'type' => 'cart_item_service' },
                { 'id'=> '2', 'type' => 'cart_item_service' },
                { 'id'=> '3', 'type' => 'cart_item_service' }
              ]}
            }, 'type'=> 'cart_service'
          }
        }
      end

      it 'applies a discount of 5%' do
        expect(subject).to eq(expect_response)
      end
    end
  end
end
