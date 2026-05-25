// Задание 1: Функции высшего порядка + ООП

import 'dart:math';

class MathProcessor {
  List<double> numbers;

  MathProcessor(this.numbers);

  List<double> process(double Function(double) handler) {
    List<double> result = [];
    for (var num in numbers) {
      result.add(handler(num));
    }
    return result;
  }

  static List<double> getRandomNumbers(int count, double max) {
    Random random = Random();
    List<double> randomNumbers = [];
    for (int i = 0; i < count; i++) {
      randomNumbers.add(random.nextDouble() * max);
    }
    return randomNumbers;
  }
} 

// Задание 2: Абстрактные классы + Наследование

import 'dart:math';

abstract class Shape {
  double area();
  
  static Shape fromJson(Map<String, dynamic> json) {
    String type = json['type'];
    
    if (type == 'circle') {
      double radius = json['radius'];
      return Circle(radius);
    } else if (type == 'rectangle') {
      double width = json['width'];
      double height = json['height'];
      return Rectangle(width, height);
    } else {
      throw Exception('Unknown shape type');
    }
  }
}

class Circle extends Shape {
  double radius;
  
  Circle(this.radius);
  
  @override
  double area() {
    return pi * radius * radius;
  }
}

class Rectangle extends Shape {
  double width;
  double height;
  
  Rectangle(this.width, this.height);
  
  @override
  double area() {
    return width * height;
  }
}

//Задание 3: Статические методы + Константы. 

class PasswordValidator {
  static String validate(String? password) {
    // Проверка на null
    if (password == null) {
      return 'Ошибка: пароль не может быть пустым';
    }
    
    // Проверка длины (больше 8 символов)
    if (password.length <= 8) {
      return 'Ошибка: пароль должен содержать больше 8 символов';
    }
    
    // Проверка наличия хотя бы одной цифры
    bool hasDigit = false;
    for (int i = 0; i < password.length; i++) {
      if (password[i].contains(RegExp(r'[0-9]'))) {
        hasDigit = true;
        break; 
      }
    }
    
    if (!hasDigit) {
      return 'Ошибка: пароль должен содержать хотя бы одну цифру';
    }
    
    // Если все проверки пройдены
    return 'Пароль создан';
  }
}

// Задание 4: Банковская система. 

// Класс для описания одного банковского счета 
class BankAccount {
  String accountNumber;  // Номер счета
  double balance = 0;    // Баланс = 0 по умолчанию
  String ownerName;      // Имя владельца
  
  // Конструктор
  BankAccount(this.accountNumber, this.ownerName);
  
  // Метод для пополнения счета
  void deposit(double amount) {
    if (amount > 0) {
      balance += amount;  
      print('Счет пополнен на $amount');
    } else {
      print('Нельзя внести отрицательную сумму');
    }
  }
  
  // Метод для снятия денег
  void withdraw(double amount) {
    if (amount > balance) {
      print('Недостаточно средств');  
    } else if (amount < 0) {
      print('Нельзя снять отрицательную сумму');
    } else {
      balance -= amount;  
      print('Снято $amount');
    }
  }
  
  // Метод для показа баланса
  void displayBalance() {
    print('Баланс счета $accountNumber (${ownerName}): $balance');
  }
}

// Класс для управления всеми счетами 
class Bank {
  List<BankAccount> accounts = [];  // Список всех счетов
  
  // Добавление нового счета
  void addAccount(String accountNumber, String ownerName) {
    BankAccount newAccount = BankAccount(accountNumber, ownerName);
    accounts.add(newAccount);  
    print('Создан счет $accountNumber для $ownerName');
  }
  
  // Поиск счета по номеру
  BankAccount? findAccount(String accountNumber) {
    for (var account in accounts) {
      if (account.accountNumber == accountNumber) {
        return account;  
      }
    }
    return null;  -
  }
  
  // Перевод денег между счетами
  void transfer(String fromAccountNumber, String toAccountNumber, double amount) {
    BankAccount? fromAccount = findAccount(fromAccountNumber);  // Счет отправителя
    BankAccount? toAccount = findAccount(toAccountNumber);      // Счет получателя
    
    // Проверяем, существуют ли оба счета
    if (fromAccount == null) {
      print('Счет отправителя не найден');
      return;
    }
    
    if (toAccount == null) {
      print('Счет получателя не найден');
      return;
    }
    
    // Проверяем, хватает ли денег
    if (amount > fromAccount.balance) {
      print('Недостаточно средств для перевода');
    } else if (amount < 0) {
      print('Нельзя перевести отрицательную сумму');
    } else {
      fromAccount.withdraw(amount);  
      toAccount.deposit(amount);     
      print('Переведено $amount со счета $fromAccountNumber на счет $toAccountNumber');
    }
  }
}

//Задание 5: Игра «РПГ-персонажи». 

import 'dart:math';

// Класс-шаблон для всех персонажей
abstract class Character {
  String name;
  int health = 100;
  int level = 1;
  
  Character(this.name);  
  
  // Абстрактные методы 
  int attack();          // Возвращает урон
  void defend(int damage);  // Уменьшает здоровье
  
  // Общий метод, проверяющий, жив ли персонаж 
  bool isAlive() {
    return health > 0;   
  }
}

// Воин
class Warrior extends Character {
  Warrior(String name) : super(name);
  
  @override
  int attack() {
    return 15 + level * 2;  // Атака: 15 + уровень * 2
  }
  
  @override
  void defend(int damage) {
    int reducedDamage = (damage * 0.8).toInt();  // Уменьшаем урон на 20%
    health -= reducedDamage;
    print('$name получил $reducedDamage урона. Здоровье: $health');
  }
}

// Маг
class Mage extends Character {
  Mage(String name) : super(name);
  
  @override
  int attack() {
    return 10 + level * 3;  // Атака: 10 + уровень * 3
  }
  
  @override
  void defend(int damage) {
    health -= damage;  // Получает полный урон
    print('$name получил $damage урона. Здоровье: $health');
  }
  
  // Дополнительный метод для лечения после атаки
  void healAfterAttack() {
    if (health < 100) {
      health += 5;
      if (health > 100) health = 100;  // Не больше 100 HP
      print('$name вылечился на 5 HP. Здоровье: $health');
    }
  }
}

// Разбойник
class Rogue extends Character {
  Random random = Random();  
  
  Rogue(String name) : super(name);
  
  @override
  int attack() {
    int baseDamage = 10 + level * 2; 
    
    // 20% шанс критического удара (урон x3)
    if (random.nextDouble() < 0.2) {
      print('$name нанес критический удар!');
      return baseDamage * 3;
    }
    
    return baseDamage;
  }
  
  @override
  void defend(int damage) {
    // 50% шанс уклониться
    if (random.nextDouble() < 0.5) {
      print('$name уклонился от атаки!');
      return;  // Не получает урон
    }
    
    health -= damage;
    print('$name получил $damage урона. Здоровье: $health');
  }
}