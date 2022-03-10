import 'package:flutter/material.dart';

class RestaurantProvider with ChangeNotifier {
  final Map<String, dynamic> _restaurantMenu = {
    "data": [
      {
        "id": '1',
        "restaurantName": "Peter Cat",
        "type": "Restaurant",
        "cuisine": "Continental",
        "ratings": "4.9",
        "totalRatings": "124",
        "category": "Side Dish",
        "productName": "Chelo Kebab",
        "price:": 455,
        "productImage": "assets/images/pngwing.com(4).png",
        "restaurantImage":
            "assets/images/davide-cantelli-jpkfc5_d-DI-unsplash.png",
        "description":
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit,\nsed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
        "restaurantAddress": "Kolkata"
      },
      {
        "id": '2',
        "restaurantName": "Peter Cat",
        "type": "Restaurant",
        "cuisine": "Continental",
        "ratings": "4.9",
        "totalRatings": "124",
        "category": "Side Dish",
        "productName": "Reshmi Kebab",
        "price:": 455,
        "productImage": "assets/images/pngwing.com(4).png",
        "restaurantImage":
            "assets/images/davide-cantelli-jpkfc5_d-DI-unsplash.png",
        "description":
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit,\nsed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
        "restaurantAddress": "Kolkata"
      },
      {
        "id": '3',
        "restaurantName": "Peter Cat",
        "type": "Restaurant",
        "cuisine": "Continental",
        "ratings": "4.9",
        "totalRatings": "124",
        "category": "Side Dish",
        "productName": "Chicken Tandoori",
        "price:": 455,
        "productImage": "assets/images/pngwing.com(4).png",
        "restaurantImage":
            "assets/images/davide-cantelli-jpkfc5_d-DI-unsplash.png",
        "description":
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit,\nsed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
        "restaurantAddress": "Kolkata"
      },
      {
        "id": '4',
        "restaurantName": "Peter Cat",
        "type": "Restaurant",
        "cuisine": "Continental",
        "ratings": "4.9",
        "totalRatings": "124",
        "category": "Side Dish",
        "productName": "Butter Chicken",
        "price:": 455,
        "productImage": "assets/images/pngwing.com(4).png",
        "restaurantImage":
            "assets/images/davide-cantelli-jpkfc5_d-DI-unsplash.png",
        "description":
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit,\nsed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
        "restaurantAddress": "Kolkata"
      },
      {
        "id": '5',
        "restaurantName": "Peter Cat",
        "type": "Restaurant",
        "cuisine": "Continental",
        "ratings": "4.9",
        "totalRatings": "124",
        "category": "Side Dish",
        "productName": "Palak Paneer",
        "price:": 455,
        "productImage": "assets/images/pngwing.com(4).png",
        "restaurantImage":
            "assets/images/davide-cantelli-jpkfc5_d-DI-unsplash.png",
        "description":
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit,\nsed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
        "restaurantAddress": "Kolkata"
      },
      {
        "id": '6',
        "restaurantName": "Peter Cat",
        "type": "Restaurant",
        "cuisine": "Continental",
        "ratings": "4.9",
        "totalRatings": "124",
        "category": "Soup",
        "productName": "Chelo Kebab",
        "price:": 455,
        "productImage": "assets/images/pngwing.com(3).png",
        "restaurantImage":
            "assets/images/davide-cantelli-jpkfc5_d-DI-unsplash.png",
        "description":
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit,\nsed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
        "restaurantAddress": "Kolkata"
      },
      {
        "id": '7',
        "restaurantName": "Peter Cat",
        "type": "Restaurant",
        "cuisine": "Continental",
        "ratings": "4.9",
        "totalRatings": "124",
        "category": "Soup",
        "productName": "Reshmi Kebab",
        "price:": 455,
        "productImage": "assets/images/pngwing.com(3).png",
        "restaurantImage":
            "assets/images/davide-cantelli-jpkfc5_d-DI-unsplash.png",
        "description":
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit,\nsed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
        "restaurantAddress": "Kolkata"
      },
      {
        "id": '8',
        "restaurantName": "Peter Cat",
        "type": "Restaurant",
        "cuisine": "Continental",
        "ratings": "4.9",
        "totalRatings": "124",
        "category": "Soup",
        "productName": "Chicken Tandoori",
        "price:": 455,
        "productImage": "assets/images/pngwing.com(3).png",
        "restaurantImage":
            "assets/images/davide-cantelli-jpkfc5_d-DI-unsplash.png",
        "description":
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit,\nsed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
        "restaurantAddress": "Kolkata"
      },
      {
        "id": '9',
        "restaurantName": "Peter Cat",
        "type": "Restaurant",
        "cuisine": "Continental",
        "ratings": "4.9",
        "totalRatings": "124",
        "category": "Soup",
        "productName": "Butter Chicken",
        "price:": 455,
        "productImage": "assets/images/pngwing.com(3).png",
        "restaurantImage":
            "assets/images/davide-cantelli-jpkfc5_d-DI-unsplash.png",
        "description":
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit,\nsed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
        "restaurantAddress": "Kolkata"
      },
      {
        "id": '10',
        "restaurantName": "Peter Cat",
        "type": "Restaurant",
        "cuisine": "Continental",
        "ratings": "4.9",
        "totalRatings": "124",
        "category": "Soup",
        "productName": "Palak Paneer",
        "price:": 455,
        "productImage": "assets/images/pngwing.com(3).png",
        "restaurantImage":
            "assets/images/davide-cantelli-jpkfc5_d-DI-unsplash.png",
        "description":
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit,\nsed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
        "restaurantAddress": "Kolkata"
      },
      {
        "id": '11',
        "restaurantName": "Peter Cat",
        "type": "Restaurant",
        "cuisine": "Continental",
        "ratings": "4.9",
        "totalRatings": "124",
        "category": "Dessert",
        "productName": "Chelo Kebab Paneer",
        "price:": 455,
        "productImage": "assets/images/pngwing.com(6).png",
        "restaurantImage":
            "assets/images/davide-cantelli-jpkfc5_d-DI-unsplash.png",
        "description":
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit,\nsed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
        "restaurantAddress": "Kolkata"
      },
      {
        "id": '12',
        "restaurantName": "Peter Cat",
        "type": "Restaurant",
        "cuisine": "Continental",
        "ratings": "4.9",
        "totalRatings": "124",
        "category": "Dessert",
        "productName": "Reshmi Kebab",
        "price:": 455,
        "productImage": "assets/images/pngwing.com(6).png",
        "restaurantImage":
            "assets/images/davide-cantelli-jpkfc5_d-DI-unsplash.png",
        "description":
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit,\nsed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
        "restaurantAddress": "Kolkata"
      },
      {
        "id": '13',
        "restaurantName": "Peter Cat",
        "type": "Restaurant",
        "cuisine": "Continental",
        "ratings": "4.9",
        "totalRatings": "124",
        "category": "Dessert",
        "productName": "Checken Tandoori",
        "price:": 455,
        "productImage": "assets/images/pngwing.com(6).png",
        "restaurantImage":
            "assets/images/davide-cantelli-jpkfc5_d-DI-unsplash.png",
        "description":
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit,\nsed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
        "restaurantAddress": "Kolkata"
      },
      {
        "id": '14',
        "restaurantName": "Peter Cat",
        "type": "Restaurant",
        "cuisine": "Continental",
        "ratings": "4.9",
        "totalRatings": "124",
        "category": "Dessert",
        "productName": "Butter Chicken",
        "price:": 455,
        "productImage": "assets/images/pngwing.com(6).png",
        "restaurantImage":
            "assets/images/davide-cantelli-jpkfc5_d-DI-unsplash.png",
        "description":
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit,\nsed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
        "restaurantAddress": "Kolkata"
      },
      {
        "id": '15',
        "restaurantName": "Peter Cat",
        "type": "Restaurant",
        "cuisine": "Continental",
        "ratings": "4.9",
        "totalRatings": "124",
        "category": "Dessert",
        "productName": "Palak Paneer",
        "price:": 455,
        "productImage": "assets/images/pngwing.com(6).png",
        "restaurantImage":
            "assets/images/davide-cantelli-jpkfc5_d-DI-unsplash.png",
        "description":
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit,\nsed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
        "restaurantAddress": "Kolkata"
      },
      {
        "id": '16',
        "restaurantName": "Peter Cat",
        "type": "Restaurant",
        "cuisine": "Continental",
        "ratings": "4.9",
        "totalRatings": "124",
        "category": "Dessert",
        "productName": "Palak Paneer",
        "price:": 455,
        "productImage": "assets/images/pngwing.com(6).png",
        "restaurantImage":
            "assets/images/davide-cantelli-jpkfc5_d-DI-unsplash.png",
        "description":
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit,\nsed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
        "restaurantAddress": "Kolkata"
      }
    ]
  };
}
