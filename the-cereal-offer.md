# **Instructions**

To encourage more sales of cereal boxes, a popular cereal shop decided to offer discounts on multiple purchases.

A box of cereal usually costs anything between $32 and $39.

- If, however, you buy two cereal boxes, you get a 5% discount on those two boxes.
- If you buy 3 cereal boxes, you get a 10% discount.
- If you buy 4 cereal boxes, you get a 20% discount.
- If you buy 5 or more, you get a 25% discount.

**Note:** cereal boxes from the **********KETO********** collection should be excluded from the discount offer.

Your mission is to write an API to calculate the price of any conceivable shopping cart (containing cereal boxes from multiple collections), returning the discounted price for each individual item and the final discounted price for the entire cart.

For example, take the following JSON input:

```JSON
{
  "cart": {
    "reference": "2d832fe0-6c96-4515-9be7-4c00983539c1",
    "lineItems": [
      { "name": "Peanut Butter", "price": "39.0", "collection": "BEST-SELLERS" },
      { "name": "Banana Cake", "price": "34.99", "collection": "DEFAULT" },
      { "name": "Cocoa", "price": "34.99", "collection": "KETO" },
      { "name": "Fruity", "price": "32", "collection": "DEFAULT" }
    ]
  }
}
```

How much does this cart of cereal boxes cost?

- 3 boxes of cereal qualify for the discount offer:
    - 10% discount offer
    - (39 + 34.99 + 32) * 0.9 = $95.39
- 1 box of cereal does not qualify:
    - 34.99 * 1 = $34.99
- Final cart cost = 95.39 + 34.99 = $130.38

### Considerations

- The JSON example provided above should be used as the input schema for the API.
- Feel free to use any technology that you are comfortable with.
- The estimated time for this challenge is typically between 3-4 hours.
