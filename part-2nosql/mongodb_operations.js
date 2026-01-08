// Use database
use fleximart_nosql;

// Operation 1: Load Data
// Import products_catalog.json into products collection
db.products.insertMany([
  {
    product_id: "ELEC001",
    name: "Samsung Galaxy S21",
    category: "Electronics",
    price: 79999,
    stock: 150,
    specs: { ram: "8GB", storage: "128GB" },
    reviews: [
      { user: "U001", rating: 5, comment: "Great!", date: new Date("2024-01-15") }
    ]
  }
]);


// Operation 2: Basic Query
// Find Electronics products with price < 50000
db.products.find(
  { category: "Electronics", price: { $lt: 50000 } },
  { name: 1, price: 1, stock: 1, _id: 0 }
);


// Operation 3: Review Analysis
// Find products with average rating >= 4
db.products.aggregate([
  { $unwind: "$reviews" },
  {
    $group: {
      _id: "$name",
      avgRating: { $avg: "$reviews.rating" }
    }
  },
  { $match: { avgRating: { $gte: 4 } } }
]);


// Operation 4: Update Operation
// Add a new review to product ELEC001
db.products.updateOne(
  { product_id: "ELEC001" },
  {
    $push: {
      reviews: {
        user: "U999",
        rating: 4,
        comment: "Good value",
        date: new Date()
      }
    }
  }
);


// Operation 5: Complex Aggregation
// Average price by category
db.products.aggregate([
  {
    $group: {
      _id: "$category",
      avg_price: { $avg: "$price" },
      product_count: { $sum: 1 }
    }
  },
  { $sort: { avg_price: -1 } }
]);

