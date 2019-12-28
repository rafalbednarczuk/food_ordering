abstract class RestaurantsEvent {}

class ClickRestaurantCard extends RestaurantsEvent {
  final int id;

  ClickRestaurantCard(this.id);
}
