import 'dart:io';

String minMaxSum(List<int> list) {
  if (list.isEmpty || list.length < 5) {
    return 'Invalid list';
  }

  int totalSum = list.reduce((a, b) => a + b);
  int maxNum = list.reduce((a, b) => a > b ? a : b);
  int minNum = list.reduce((a, b) => a < b ? a : b);

  int maxSum = totalSum - minNum;
  int minSum = totalSum - maxNum;

  List<int> evenList = list.where((number) => number % 2 == 0).toList();
  List<int> oddList = list.where((number) => number % 2 != 0).toList();

  String evenElements = evenList.join(', ');
  String oddElements = oddList.join(', ');

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
  List<int> arr = stdin.readLineSync()!.split(' ').map(int.parse).toList();
  String result = minMaxSum(arr);
  print(result);
}
