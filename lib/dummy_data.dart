class DummyData {
  final _dummyMovies = [
    {
      "id": "m1",
      "name": "Star Wars",
      "date": "03-08-2020",
      "rating": 4,
      "category": "Action",
      "releaseId": 3,
      "price": 100,
      "url":
          "https://cdn.pocket-lint.com/r/s/1200x/assets/images/147767-tv-feature-what-order-should-you-watch-all-the-star-wars-films-image1-1wdfjceytb.jpg",
      "description":
          "This is the random generated escription to write as a dummy text.This is the random generated escription to write as a dummy text.This is the random generated escription to write as a dummy text.This is the random generated escription to write as a dummy text.This is the random generated escription to write as a dummy text.",
    },
    {
      "id": "m2",
      "name": "Inception",
      "date": "06-08-2020",
      "rating": 3,
      "category": "Thriller",
      "releaseId": 6,
      "price": 150,
      "url": "https://i.ytimg.com/vi/E1iqGiX0lSg/movieposter.jpg",
      "description":
          "This is the random generated escription to write as a dummy text.This is the random generated escription to write as a dummy text.This is the random generated escription to write as a dummy text.This is the random generated escription to write as a dummy text.This is the random generated escription to write as a dummy text.",
    },
    {
      "id": "m3",
      "name": "Jurrasic Park",
      "date": "02-08-2020",
      "rating": 4,
      "category": "Drama",
      "releaseId": 2,
      "price": 120,
      "url": "https://i.ytimg.com/vi/f5C7dqrAItM/movieposter.jpg",
      "description":
          "This is the random generated escription to write as a dummy text.This is the random generated escription to write as a dummy text.This is the random generated escription to write as a dummy text.This is the random generated escription to write as a dummy text.This is the random generated escription to write as a dummy text.",
    },
    {
      "id": "m4",
      "name": "Interstellar",
      "date": "05-08-2020",
      "rating": 5,
      "category": "Thriller",
      "releaseId": 5,
      "price": 200,
      "url":
          "https://upload.wikimedia.org/wikipedia/en/b/bc/Interstellar_film_poster.jpg",
      "description":
          "This is the random generated escription to write as a dummy text.This is the random generated escription to write as a dummy text.This is the random generated escription to write as a dummy text.This is the random generated escription to write as a dummy text.This is the random generated escription to write as a dummy text.",
    },
    {
      "id": "m5",
      "name": "Harry Potter",
      "date": "01-08-2020",
      "rating": 4,
      "category": "Drama",
      "releaseId": 1,
      "price": 170,
      "url":
          "https://upload.wikimedia.org/wikipedia/en/b/bc/Interstellar_film_poster.jpg",
      "description":
          "This is the random generated escription to write as a dummy text.This is the random generated escription to write as a dummy text.This is the random generated escription to write as a dummy text.This is the random generated escription to write as a dummy text.This is the random generated escription to write as a dummy text.",
    },
    {
      "id": "m6",
      "name": "Avengers",
      "date": "04-08-2020",
      "rating": 5,
      "category": "Action",
      "releaseId": 4,
      "price": 200,
      "url":
          "https://terrigen-cdn-dev.marvel.com/content/prod/1x/avengersendgame_lob_crd_05.jpg",
      "description":
          "This is the random generated escription to write as a dummy text.This is the random generated escription to write as a dummy text.This is the random generated escription to write as a dummy text.This is the random generated escription to write as a dummy text.This is the random generated escription to write as a dummy text.",
    },
    {
      "id": "m7",
      "name": "Justice League",
      "date": "03-08-2020",
      "rating": 4,
      "category": "Action",
      "releaseId": 3,
      "price": 180,
      "url":
          "https://sofy.tv/blog/wp-content/uploads/2017/12/upcoming-hollywood-movies-you-shouldnt-miss-1400x653-1505901970_1100x513.jpg",
      "description":
          "This is the random generated escription to write as a dummy text.This is the random generated escription to write as a dummy text.This is the random generated escription to write as a dummy text.This is the random generated escription to write as a dummy text.This is the random generated escription to write as a dummy text.",
    },
  ];

  List<Map> get data {
    return _dummyMovies;
  }

  List<Map> sort() {
  }

  List<Map> category(String category) {
    if (category == "action") {
      return _dummyMovies
          .where((element) => element["category"] == "Action")
          .toList();
    }
    if (category == "thriller") {
      return _dummyMovies
          .where((element) => element["category"] == "Thriller")
          .toList();
    }
    if (category == "drama") {
      return _dummyMovies
          .where((element) => element["category"] == "Drama")
          .toList();
    }
    return null;
  }
}
