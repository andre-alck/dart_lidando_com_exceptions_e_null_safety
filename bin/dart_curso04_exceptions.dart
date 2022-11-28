import 'dart:io';

main() {
  print('STARTED:\tmain');
  functionOne();
  print('FINISHED:\tmain');
}

functionOne() {
  print('STARTED:\tfunctionOne');
  try {
    functionTwo();
  } on IOException catch (ioException) {
    print('IOException:\t$ioException');
  } finally {
    print('FINALLY');
  }

  print('FINISHED:\tfunctionOne');
}

functionTwo() {
  print('STARTED:\tfunctionTwo');
  for (int i = 0; i < 5; i++) {
    print(i);
    double amount = double.parse('Not a number.');
  }
  print('FINISHED:\tfunctionTwo');
}
