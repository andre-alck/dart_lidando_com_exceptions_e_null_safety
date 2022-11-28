main() {
  print('started main');
  functionOne();
  print('finished main');
}

functionOne() {
  print('started functionOne');
  functionTwo();
  print('finished functionOne');
}

functionTwo() {
  print('started functionTwo');
  for (int i = 0; i < 5; i++) {
    print(i);
  }
  print('finished functionTwo');
}
