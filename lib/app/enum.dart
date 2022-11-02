enum OrderStatus {
  INPROGRESS,
  DONE,
  PRE_CANCELED,
  CANCELED,
}

extension TopicString on String {
  OrderStatus toEnum() {
    switch (this) {
      case 'INPROGRESS':
        return OrderStatus.INPROGRESS;
      case 'DONE':
        return OrderStatus.DONE;
      case 'PRE_CANCELED':
        return OrderStatus.PRE_CANCELED;
      case 'CANCELED':
        return OrderStatus.CANCELED;
      default:
        return OrderStatus.INPROGRESS;
    }
  }
}

extension OrderStatusString on OrderStatus {
  String toStr() {
    switch (this) {
      case  OrderStatus.INPROGRESS:
       return 'INPROGRESS';
      case OrderStatus.DONE:
        return 'DONE';
      case OrderStatus.PRE_CANCELED:
        return 'PRE_CANCELED';
      case OrderStatus.CANCELED:
        return 'CANCELED';
      default:
        return 'INPROGRESS';
    }
  }
}