enum OrderStatus {
  INPROGRESS,
  DONE,
  PRE_CANCELED,
  CANCELED,
}

extension TopicString on String {
  OrderStatus toOrderStatusEnum() {
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

enum UserRole {
  OWNER,
  MANAGER,
  WAITER,
  BARMAN
}

extension UserRoleFromString on String {
  UserRole toUserRoleEnum() {
    switch (this) {
      case 'OWNER':
        return UserRole.OWNER;
      case 'MANAGER':
        return UserRole.MANAGER;
      case 'WAITER':
        return UserRole.WAITER;
      case 'BARMAN':
        return UserRole.BARMAN;
      default:
        return UserRole.WAITER;
    }
  }
}

extension UserRoleToString on UserRole{
  String toStr() {
    switch (this) {
      case UserRole.OWNER:
       return 'OWNER';
      case UserRole.MANAGER:
        return 'MANAGER';
      case UserRole.WAITER:
        return 'WAITER';
      case UserRole.BARMAN:
        return 'BARMAN';
      default:
        return 'WAITER';
    }
  }
}