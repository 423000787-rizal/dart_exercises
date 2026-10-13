// PC16 Week 8: Logic Problem Set - Grade Evaluator
// Author: [Your Name Here]

/// Function to process raw score inputs
/// - Parameter: rawScores (List of inputs to process)
/// - Return Value: double (Calculated average of valid scores)
double processAndEvaluateScores(List<dynamic> rawScores) {
  int validCount = 0;
  double totalSum = 0.0;

  // LOOP: Iterates a fixed number of times over the input list
  for (int i = 0; i < rawScores.length; i++) {
    dynamic item = rawScores[i];
    
    // Parse the input into a double (will throw FormatException if input is non-numeric)
    double score = double.parse(item.toString());

    // CONDITIONAL LOGIC: Evaluates score range and prints specific status
    if (score >= 75.0) {
      print('Item ${i + 1}: Score $score -> PASSED');
      totalSum += score;
      validCount++;
    } else if (score >= 0.0) {
      print('Item ${i + 1}: Score $score -> FAILED');
      totalSum += score;
      validCount++;
    } else {
      print('Item ${i + 1}: Score $score -> INVALID (Negative value ignored)');
    }
  }

  if (validCount == 0) {
    return 0.0;
  }

  return totalSum / validCount;
}

void main() {
  print('=== TEST CASE 1: Valid Input Data ===');
  List<dynamic> validInputs = ['85.5', '92.0', '64.0', '78.5', '90.0'];

  // ERROR HANDLING: Wrapping function call in a try/catch block
  try {
    double average = processAndEvaluateScores(validInputs);
    print('Calculated Average Score: ${average.toStringAsFixed(2)}\n');
  } catch (e) {
    print('Error encountered during evaluation: $e\n');
  }

  print('=== TEST CASE 2: Testing Bad Input (Graceful Error Handling) ===');
  // Intentional bad input ('invalid_score') to test error handling
  List<dynamic> badInputs = ['88.0', 'invalid_score', '95.0'];

  try {
    print('Attempting to process list with invalid data...');
    double average = processAndEvaluateScores(badInputs);
    print('Calculated Average Score: ${average.toStringAsFixed(2)}');
  } on FormatException catch (e) {
    // Handles the parsing error gracefully without crashing
    print('-> TRY/CATCH CAUGHT AN ERROR: System encountered invalid non-numeric input.');
    print('-> Details: $e');
    print('-> Result: Program handled error gracefully without crashing!');
  } catch (e) {
    print('-> General Error: $e');
  }
}
