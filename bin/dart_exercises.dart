void main() {
  // Scenario: Coffee Shop Order Tracker
  String itemName = 'Caramel Macchiato';
  int quantity = 5;
  double unitPrice = 125.50;
  bool isVipCustomer = true;

  double rawTotal = quantity * unitPrice;
  int rewardStamps = quantity ~/ 2;
  int itemsRemaining = quantity % 2;

  int totalStamps = rewardStamps;
  totalStamps++;

  bool qualifiesForDiscount = rawTotal >= 500.0;

  print('=== Coffee Shop Order Summary ===');
  print('Customer VIP Status: $isVipCustomer');
  print('Item: $itemName');
  print('Quantity: $quantity x ₱$unitPrice');
  print('Subtotal: ₱$rawTotal');
  print('Stamps Earned: $rewardStamps (Total with bonus: $totalStamps)');
  print('Progress to next stamp: $itemsRemaining item(s)');
  print('Qualifies for Bulk Discount? $qualifiesForDiscount');
}
