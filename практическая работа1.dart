// Задание 1 Переменные и типы данных

void main (){
  // создаем переменные
  int age = 26; // возраст
  double grade = 4.3; // средний балл
  String name = 'Elena'; // имя
  bool studStat = true; // статус студента 
  
  // вывод данных
  print('''Имя: $name ${name.runtimeType}
 Возраст: $age ${age.runtimeType}
 Средний балл: $grade ${grade.runtimeType}
 Студент: ${studStat ? 'да' : 'нет'} ${studStat.runtimeType}''');
}

// Задание 2 Цикл (FizzBuzz)

void main() {
  int n = 1; // задаем начальное значение n
  while (n <= 100) {
    if (n % 3 == 0 && n % 5 == 0) { 
      print('$n FizzBuzz'); // проверяем, что n кратно 3 и 5 и выводим FizzBuzz
    } 
    else if (n % 3 == 0) {
      print('$n Fizz'); // проверяем, что n кратно 3 и выводим Fizz
    } 
    else if (n % 5 == 0) {
      print('$n Buzz'); // проверяем, что n кратно 5 и выводим Buzz
    } 
    else {
      print(n); // проверяем, что n не кратно ни 3, ни 5 и выводим n
    }
    n++; // прибавляем к n 1
  }
}

// Задание 3 Работа со строками и цикл (Подсчёт гласных)

void main() {
  String word = 'Flutter'; // строка, содержащая слово
  List<String> vowel = ['a', 'e', 'i', 'o', 'u', 'y', 'а', 'о', 'и', 'е', 'ё', 'ю', 'я', 'у', 'ы', 'э']; // словарь, содержащий гласные (англ + русские)
  
  int n = 0; // счетчик гласных в строке
  for (int i = 0; i < word.length; i++) { // цикл, который перебирает по индексу все буквы в строке
    if (vowel.contains(word[i].toLowerCase())) { // условие, проверяющее, что буква с индексом i в нижнем регистре содержится в словаре, и добавляющая к n +1, если содержится
      n++; 
    }
  }
// вывод результата   
  print('''
Слово: $word
Гласных букв: $n''');
}

// Задание 4 Умный калькулятор с обработкой ошибок

import 'dart:io';

void main() {
  List<String> opers = ['+', '-', '*', '/', '%'];
  
  stdout.write('Введите первое число: ');
  double? num1 = double.tryParse(stdin.readLineSync() ?? '');
  
  stdout.write('Введите оператор (+, -, *, /, %): ');
  String? oper = stdin.readLineSync();
  
  stdout.write('Введите второе число: ');
  double? num2 = double.tryParse(stdin.readLineSync() ?? '');
  
  // Проверки
  if (num1 == null) {
    print('Ошибка: Первое число должно быть числом');
    return;
  }
  
  if (num2 == null) {
    print('Ошибка: Второе число должно быть числом');
    return;
  }
  
  if (oper == null || !opers.contains(oper)) {
    print('Ошибка: Введите один из операторов: +, -, *, /, %');
    return;
  }
  
  double? result;
  
  switch (oper) {
    case '+':
      result = num1 + num2;
      break;
    case '-':
      result = num1 - num2;
      break;
    case '*':
      result = num1 * num2;
      break;
    case '/':
      if (num2 == 0) {
        print('Ошибка: Деление на ноль');
        return;
      }
      result = num1 / num2;
      break;
    case '%':
      if (num2 == 0) {
        print('Ошибка: Деление на ноль');
        return;
      }
      result = num1 % num2;
      break;
  }
  
  print('$num1 $oper $num2 = $result');
}