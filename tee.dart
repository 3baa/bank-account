
import 'dart:io';


// part 1..............................................................................................
// main class for BankAccount
class BankAccount {
  late String ownerName;
  late double balance;
  Map<String, double> transactionLog = {};
  BankAccount(String ownerName, double balance) {
    this.ownerName = ownerName;
    this.balance = balance;
  }

  // method to deposit money
  void deposit(double amount) {
    if (amount <=0) {
      throw  posstivwwException('Invalid input. Only positive numbers accepted.');

    }
    
    balance += amount ;
    transactionLog['Deposit: ${amount}'] = amount;//part 5 ////////////////////////////
  }

  // method to withdraw money and throw exception when amount isnot posstive number
  //and when amount>balance
  void withdraw(double amount) {
    if (amount <=0) {
      throw  posstivwwException('Invalid input. Only positive numbers accepted.');

    } else if(amount > balance) {
      throw InsufficientbalanceException('Insufficient balance');
    }
     
    balance -= amount;
    transactionLog['Withdrawal: ${amount}'] = amount;//part 5 /////////////////////////////
  }


  void setName(String ownerName ){
    this.ownerName = ownerName;
  }

  void printTransactionLog() {
    if (transactionLog.isEmpty) {
      print('No transactions available.');
    } else {
      transactionLog.forEach((key, value) {
        print('$key: ${value}'); // print el map part 5 //////////////////////////////
      });
    }
  }
}
//part 2 .............................................................................
// custom exception for balance
class InsufficientbalanceException implements Exception {
  late String message;

  InsufficientbalanceException(String message) {
    this.message = message;
  }

  @override
  String toString() => "Error: $message";
}
//custom exception for invalid input
class invalidationException implements Exception {
  late String message;

  invalidationException(String message) {
    this.message = message;
  }

  @override
  String toString() => "Error: $message";
}
//exception for negative input
class posstivwwException implements Exception {
  late String message;

  posstivwwException(String message) {
    this.message = message;
  }

  @override
  String toString() => "Error: $message";
}
void main() {
  
  BankAccount client = BankAccount('Basmala Alaa', 500.0);
//part 3 .................................................................................
  while (true) {
    print("1. Create account name");
    print("2. Deposit Money");
    print("3. Withdraw Money");
    print("4. Check Current Balance");
    print("5. View Transaction Log");
    print("6. Exit");
    stdout.write(" select an option ");
    int option = int.parse(stdin.readLineSync()!);

    if (option == 1) {
      stdout.write("Enter your name: ");
      String newName = stdin.readLineSync()!;
      client.setName(newName);
      print("${client.ownerName}, you have created an account ");

    } else if (option == 2) {
      stdout.write(" deposit mony to your acc ");
      try{//part 4 ..................................................................................
      double depositAmount = double.parse(stdin.readLineSync()!);
      client.deposit(depositAmount);
      print("You have deposit ${depositAmount}. Your new balance is ${client.balance}");
      }on FormatException{ 
        throw invalidationException('invalid input .only numbers accepted');
      }catch(e){
        print(e.toString());
      }
    } else if (option == 3) {
      try{
      stdout.write("Enter withdraw amount");
      double withdrawAmount = double.parse(stdin.readLineSync()!);
        client.withdraw(withdrawAmount);
        print("You have withdrawn:${withdrawAmount}. Your new balance is: ${client.balance}");
       } on FormatException{
        throw invalidationException('ivailed input only numbers accepted');
       }
       catch (e) {
        print(e.toString());
      }
//.......................
    } else if (option == 4) {
      print("Your current balance is ${client.balance}");

    } else if (option == 5) {
      client.printTransactionLog();

    } else if (option == 6) {
      print("Exiting the application.");
      break;

    } else {
      print("This option is invalid.");
    }
  }
}

