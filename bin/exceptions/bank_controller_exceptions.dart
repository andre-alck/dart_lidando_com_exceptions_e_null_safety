class SenderIdInvalidException implements Exception {
  String idSender;
  SenderIdInvalidException({required this.idSender});
}

class ReceiverIdInvalidException implements Exception {}

class SenderNotAuthenticatedException implements Exception {}

class SenderBalanceLowerThanAmountException implements Exception {}
