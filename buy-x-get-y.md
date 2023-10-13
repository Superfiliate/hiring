# Instructions

With the holidays approaching, a popular cereal shop has decided to offer its customers a special discount known as "Buy X get Y."

If you purchase any item from the **X** list, you will receive a discount on one item from the **Y** list. The price of a box of cereal typically ranges from $32 to $39.

On the shop's website, they intend to promote the discount using the following banner:

---

**Special Holiday Offer!!**

Purchase Peanut Butter, Cocoa, or Fruity and receive an additional box of Banana Cake, Cocoa, or Chocolate at a **50% discount!**

---

For this challenge, you should use the following JSON schema that represents the Buy X get Y discount configuration:

```json
{
  "prerequisite_skus": ["PEANUT-BUTTER", "COCOA", "FRUITY"],
  "eligible_skus": ["BANANA-CAKE", "COCOA", "CHOCOLATE"],
  "discount_unit": "percentage",
  "discount_value": "50.0"
} 
```

- To apply the discount, the customer must purchase at least one product from the `prequisite_skus` field. This field represents the "Buy X" side of the equation.
- The discount will only be applied to one product from the `eligible_skus` list. This field represents the "Get Y" side of the equation.
- The field `discount_unit` represents the unit that will be used to calculate the final discount value.
- The field `discount_value` represents the value that will be deducted from the eligible product.

**Note:** If there is more than one eligible item in the cart, the discount should be applied to the cheapest one.

Your mission is to write an API to calculate the price of any conceivable shopping cart (containing multiple cereal boxes), returning the discounted price for each individual item and the final discounted price for the entire cart.

For example, take the following JSON input:

```json
{
  "cart": {
    "reference": "2d832fe0-6c96-4515-9be7-4c00983539c1",
    "lineItems": [
      { "name": "Peanut Butter", "price": "39.0", "sku": "PEANUT-BUTTER" },
      { "name": "Fruity", "price": "34.99", "sku": "FRUITY" },
      { "name": "Chocolate", "price": "32", "sku": "CHOCOLATE" }
    ]
  }
}
```

How much does this cart of cereal boxes cost?

- The discount is valid, as it includes at least one item from the prerequisites: `PEANUT-BUTTER`
- 1 item is eligible for the discount: `CHOCOLATE`
    - 32 - (32 * 0.5) = $16
- Final cart cost = 39 + 34.99 + 16 = $89.99

### Considerations

- The JSON input example provided above should be used as the input schema for the API.
- Feel free to use any technology that you are comfortable with.
- The estimated time for this challenge is typically between 3-4 hours.
