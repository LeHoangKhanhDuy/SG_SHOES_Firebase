

class TPricingCalculator{

  //Tính giá dựa vào thuế phí
  static double calculateTotalPrice(double productSize, String location){
    double taxRate = getTaxRateForLocation(location);
    double taxAmount = productSize * taxRate;

    double shippingCost = getShippingCost(location);

    double totalPrice = productSize + taxAmount + shippingCost;
    return totalPrice;
  }

  //Shipping 
  static String calculateShippingCost(double productSize, String location){
    double shippingCost = getShippingCost(location);
    return shippingCost.toStringAsFixed(2);
  }

  //Tax
  static String calculateTax(double productSize, String location){
    double taxRate = getTaxRateForLocation(location);
    double taxAmount = productSize * taxRate;
    return taxAmount.toStringAsFixed(2);
  }

  static double getTaxRateForLocation(String location){
    return 0.10;
  }
   
  static double getShippingCost(String location){
    return 5.00;
  }
}