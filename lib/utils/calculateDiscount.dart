String calculateDiscount(int price, double discountPercentage) {
  double discountedPrice = price - ((price * discountPercentage) / 100);

  return discountedPrice.toStringAsFixed(2);
}
