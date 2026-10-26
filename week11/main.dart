// Base Class representing a general Bank Account
class BankAccount {
  String accountNumber;
  String accountHolder;
  double balance;

  BankAccount(this.accountNumber, this.accountHolder, this.balance);

  // Method to display basic account info
  void displayInfo() {
    print('Account No: $accountNumber | Holder: $accountHolder | Balance: \$${balance.toStringAsFixed(2)}');
  }

  // Future-returning async method simulating data saving to a remote database
  Future<String> saveAccountRecord() async {
    print('  [Background Task] Connect to remote server for account #$accountNumber...');

    // Simulate 2-second server latency/delay
    await Future.delayed(Duration(seconds: 2));

    return 'SUCCESS: Account record #$accountNumber successfully archived to database.';
  }
}

// Derived Class inheriting from BankAccount
class SavingsAccount extends BankAccount {
  double interestRate;

  SavingsAccount(
    String accountNumber,
    String accountHolder,
    double balance,
    this.interestRate,
  ) : super(accountNumber, accountHolder, balance);

  @override
  void displayInfo() {
    super.displayInfo();
    print('  Account Type: Savings Account | Interest Rate: $interestRate%');
  }
}

// Main entry point marked with `async`
void main() async {
  print('=== Week 11: Async OOP Implementation Demo ===\n');

  // Step 1: Create an instance of the derived class
  SavingsAccount userAccount = SavingsAccount('ACC-88219', 'Maria Santos', 2500.75, 3.5);
  userAccount.displayInfo();

  print('\n--------------------------------------------------');

  // Step 2: Immediate message printed before initiating asynchronous call
  print('Log 1: Initiating asynchronous account record backup...');

  // Step 3: Trigger the async method call
  // Demonstrating non-blocking behavior: we trigger the Future and handle it with await
  print('Log 2: Waiting for background network process to complete...');

  // Step 4: Await the result of the Future-returning method (2-second delay happens here)
  String backupStatus = await userAccount.saveAccountRecord();

  // Step 5: Print the result only after the Future resolves
  print('Log 3: Received Result -> $backupStatus');

  print('\n=== Application Execution Complete ===');
}
