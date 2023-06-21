# Mini-Max Sum

The `miniMaxSum` function calculates the minimum and maximum values that can be obtained by summing exactly four out of five positive integers. It takes an array of five integers as input and returns the respective minimum and maximum sums.

## Usage

To use the `miniMaxSum` function, follow these steps:

1. Call the `miniMaxSum` function, passing in an array of five positive integers.
2. The function will compute the minimum and maximum sums.
3. The result will be printed as two space-separated long integers on a single line.

Here's an example of how to use the `miniMaxSum` function:

```dart
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

```
## Time Complexity
The time complexity of the miniMaxSum function is O(n), where n is the number of elements in the input list.

**Explanation**:
- Calculating the total sum of the list using the reduce method takes O(n) time, as it needs to iterate over each element in the list once.
- Finding the maximum and minimum numbers in the list using the reduce method and ternary operator also takes O(n) time, as it requires iterating over each element in the list once.
- Calculating the maximum sum and minimum sum by subtracting the minNum from the totalSum takes constant time, which is O(1).

Therefore, the dominant time complexity in this function is O(n).

## Space Complexity
The space complexity of the miniMaxSum function is O(1), which means it uses a constant amount of additional space. Regardless of the size of the input list, the function only uses a few variables to store intermediate results and the final minimum and maximum sums.

## Test Cases
**Example 1**:   
```bash
Input: [1, 2, 3, 4, 5]
Expected Output: "14 10"
Explanation: The minimum sum is 1 + 2 + 3 + 4 = 10, and the maximum sum is 2 + 3 + 4 + 5 = 14.
```
**Example 2**:
```bash
Input: [5, 5, 5, 5, 5]
Expected Output: "20 20"
Explanation: All numbers are the same, so both the minimum and maximum sums will be equal to the sum of all numbers, which is 20.
```
**Example 3**:
```bash
Input: [5, 4, 3, 2, 1]
Expected Output: "14 10"
Explanation: The minimum sum is obtained by adding the four smallest numbers: 1 + 2 + 3 + 4 = 10. 
The maximum sum is obtained by adding the four largest numbers: 2 + 3 + 4 + 5 = 14.
```
**Example 4**:
```bash
Input: [7, 2, 9, 4, 1]
Expected Output: "22 14"
Explanation: The minimum sum is obtained by adding the four smallest numbers: 1 + 2 + 4 + 7 = 14. 
The maximum sum is obtained by adding the four largest numbers: 2 + 4 + 7 + 9 = 22.
```
**Example 5**:
```bash
Input: [0, 0, 0, 0, 0]
Expected Output: "0 0"
Explanation: All numbers are 0, so both the minimum and maximum sums will be 0.
```
