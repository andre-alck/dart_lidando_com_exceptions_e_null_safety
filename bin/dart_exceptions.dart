import 'dart:math';

import 'controllers/bank_controller.dart';
import 'exceptions/bank_controller_exceptions.dart';
import 'models/account.dart';

void testingNullSafety() {
  Account? myAccount = Account(
      name: "Andre Santos Alckmin de Carvalho",
      balance: 300,
      isAuthenticated: true);

  Random randomNumberGenerator = Random();
  if (randomNumberGenerator.nextInt(10) % 2 == 0) {
    myAccount.createdAt = DateTime.now();
  }

  // Não funciona pois o atributo createdAt pode pode ser nulo.
  // print(myAccount.createdAt.day);

  // Funciona, caso o atributo createdAt nao seja nulo. E ma pratica.
  // print(myAccount.createdAt!.day);

  // Funciona e e necesario adicionar '?', mesmo sendo certo que createdAt nao sera nulo.
  if (myAccount.createdAt != null) {
    print(myAccount.createdAt?.day);
  } else {
    print("Data Nula");
  }

  // Explicar que é uma situação que válida encadear "?"
  // print(myAccount?.createdAt?.day); // Explicar warning Flow Analisys
  Account? otherAccount;
  print(otherAccount?.createdAt?.day);
}

void main() {
  testingNullSafety();

  // Criando o banco
  BankController bankController = BankController();

  // Adicionando contas
  bankController.addAccount(
      id: "Andre",
      account: Account(
          name: "Andre Santos Alckmin de Carvalho",
          balance: 900,
          isAuthenticated: true));

  bankController.addAccount(
      id: "Jackeline",
      account: Account(
          name: "Jackeline Kaneko Pereira",
          balance: 2400,
          isAuthenticated: true));

  // Fazendo transferência
  try {
    bankController.makeTransfer(
        idSender: "Andre", idReceiver: "Jackeline", amount: 200);
    print("Transação concluída com sucesso");
  } on SenderIdInvalidException catch (e) {
    print(e.message);
  } on ReceiverIdInvalidException catch (e) {
    print(e);
  } on SenderNotAuthenticatedException catch (e) {
    print(e);
  } on SenderBalanceLowerThanAmountException catch (e) {
    print(e);
  } catch (e) {
    print("Erro desconhecido.");
  }
}
