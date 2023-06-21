import 'dart:io';

String miniMaxSum(List<int> list) {
  // Check if the list is empty or has less than 5 elements

  if (list.isEmpty || list.length < 5) {
    return 'Invalid list';
  }

  // Calculate the total sum of the list using the `reduce` method
  int totalSum = list.reduce((a, b) => a + b);

  // Find the maximum and minimum numbers in the list using the `reduce` method and ternary operator
  int maxNum = list.reduce((a, b) => a > b ? a : b);
  int minNum = list.reduce((a, b) => a < b ? a : b);

  // Calculate the maximum sum and minimum sum by subtracting the minNum from the totalSum
  int maxSum = totalSum - minNum;
  int minSum = totalSum - maxNum;

  // Filter even and odd numbers into separate lists using the `where` method
  List<int> evenList = list.where((number) => number % 2 == 0).toList();
  List<int> oddList = list.where((number) => number % 2 != 0).toList();

  // Convert the evenList and oddList to strings with comma-separated elements using `join`
  String evenElements = evenList.join(', ');
  String oddElements = oddList.join(', ');

  // Return a formatted string with the computed results
  return '''
  $maxSum, $minSum
  Max in array: $maxNum
  Min in array: $minNum
  Total of array: $totalSum
  Even Elements: $evenElements
  Odd Elements: $oddElements
''';
}

void main() {
  stdout.write('Enter a list of integers (space-separated): ');

  /* Read input from the user and split it into a list of strings.
     Convert the list of strings into a list of integers using `map` and `int.parse` */
  List<int> arr = stdin.readLineSync()!.split(' ').map(int.parse).toList();

  // Call the `minMaxSum` function with the list of integers and store the result
  String result = miniMaxSum(arr);
  // Display the result
  print(result);
}
