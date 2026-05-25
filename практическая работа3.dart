//Задание 1: Класс Phone. 

// Класс, описывающий телефон
class Phone {
  String number;  //Номер 
  String model;  //Модель
  double weight; //Вес
  
  // Конструктор с тремя параметрами
  Phone(this.number, this.model, this.weight);
  
  // Конструктор с двумя параметрами (
  Phone.withTwoParams(String number, String model) : this(number, model, 0);
  
  // Конструктор без параметров 
  Phone.empty() : this.withTwoParams('Неизвестно', 'Неизвестно');
  
  // Метод, который выводит имя звонящего
  void receiveCall(String name) {
    print('Звонит $name');
  }
  
  // Метод, который возвращает номер телефона
  String getNumber() {
    return number;
  }
  
  // Метод sendMessage - принимает любое количество номеров
  void sendMessage(List<String> numbers) {
    print('Отправка сообщения на номера:');
    for (var num in numbers) {
      print(num);
    }
  }
}

void main() {
  // Создаем три экземпляра класса Phone
  Phone phone1 = Phone('+7-999-123-45-67', 'iPhone 15', 180);
  Phone phone2 = Phone.withTwoParams('+7-999-234-56-78', 'Samsung Galaxy');
  Phone phone3 = Phone.empty();
  
  // Выводим значения переменных
  print('Телефон 1: номер=${phone1.number}, модель=${phone1.model}, вес=${phone1.weight}');
  print('Телефон 2: номер=${phone2.number}, модель=${phone2.model}, вес=${phone2.weight}');
  print('Телефон 3: номер=${phone3.number}, модель=${phone3.model}, вес=${phone3.weight}');
  
  print(''); 
  
  // Вызываем методы
  phone1.receiveCall('Анна');
  print('Номер телефона 1: ${phone1.getNumber()}');
  
  phone2.receiveCall('Иван');
  print('Номер телефона 2: ${phone2.getNumber()}');
  
  phone3.receiveCall('Мария');
  print('Номер телефона 3: ${phone3.getNumber()}');
  
  print(''); 
  
  // Вызываем sendMessage
  phone1.sendMessage(['+7-999-123-45-67', '+7-999-234-56-78', '+7-999-345-67-89']);
}

// Задание 2: Класс Матрица. 

// Класс Матрица
class Matrix {
  late List<List<double>> data;
  int rows;    // Количество строк
  int cols;    // Количество столбцов
  
  // Конструктор нулевой матрицы 
  Matrix(this.rows, this.cols) {
    data = [];
    for (int i = 0; i < rows; i++) {
      List<double> row = [];
      for (int j = 0; j < cols; j++) {
        row.add(0.0);
      }
      data.add(row);
    }
  }
  
  // Метод для заполнения матрицы значениями
  void setValue(int row, int col, double value) {
    data[row][col] = value;
  }
  
  // Сложение с другой матрицей
  Matrix add(Matrix other) {
    if (rows != other.rows || cols != other.cols) {
      print('Ошибка: матрицы разного размера');
      return this;
    }
    
    Matrix result = Matrix(rows, cols);
    for (int i = 0; i < rows; i++) {
      for (int j = 0; j < cols; j++) {
        result.data[i][j] = data[i][j] + other.data[i][j];
      }
    }
    return result;
  }
  
  // Умножение на число
  Matrix multiplyByNumber(double number) {
    Matrix result = Matrix(rows, cols);
    for (int i = 0; i < rows; i++) {
      for (int j = 0; j < cols; j++) {
        result.data[i][j] = data[i][j] * number;
      }
    }
    return result;
  }
  
  // Умножение матриц
  Matrix multiplyByMatrix(Matrix other) {
    if (cols != other.rows) {
      print('Ошибка: количество столбцов первой матрицы не равно количеству строк второй');
      return this;
    }
    
    Matrix result = Matrix(rows, other.cols);
    for (int i = 0; i < rows; i++) {
      for (int j = 0; j < other.cols; j++) {
        double sum = 0;
        for (int k = 0; k < cols; k++) {
          sum += data[i][k] * other.data[k][j];
        }
        result.data[i][j] = sum;
      }
    }
    return result;
  }
  
  // Вывод на печать
  void printMatrix() {
    for (int i = 0; i < rows; i++) {
      String row = '';
      for (int j = 0; j < cols; j++) {
        row += '${data[i][j]} ';
      }
      print(row);
    }
  }
}

// Задание 3: Рекурсивный вывод чисел. 

// Рекурсивная функция для вывода чисел от A до B
void printNumbers(int a, int b) {
  // Выводим текущее число
  print(a);
  
  // Остановка, если A = B
  if (a == b) {
    return;
  }
  
  // Если A < B, идем вверх (+1), иначе вниз (-1)
  int step = (a < b) ? 1 : -1;
  
  // Рекурсивный вызов с новым значением
  printNumbers(a + step, b);
}

void main() {
  print('Числа от 1 до 5:');
  printNumbers(1, 5);
  
  print('\nЧисла от 5 до 1:');
  printNumbers(5, 1);
}

// Задание 4: Наследование Student, Aspirant. 

// Класс Студент
class Student {
  String firstName; //имя
  String lastName; //фамилия 
  String group; //группа
  double averageMark; //средняя оценка
  
  // Конструктор
  Student(this.firstName, this.lastName, this.group, this.averageMark);
  
  // Метод, который возвращает сумму стипендии
  double getScholarship() {
    if (averageMark == 5) {
      return 2000;  
    } else {
      return 1900;  
    }
  }
}

// Класс Аспирант - наследует класс Студент
class Aspirant extends Student {
  
  // Конструктор
  Aspirant(String firstName, String lastName, String group, double averageMark)
      : super(firstName, lastName, group, averageMark);
  
  // Переопределение метода getScholarship
  @override
  double getScholarship() {
    if (averageMark == 5) {
      return 2500;  
    } else {
      return 2200;  
    }
  }
}

void main() {
  // Массив данных
  List<Student> students = [];
  
  // Добавляем студентов
  students.add(Student('Иван', 'Петров', 'Группа 104', 5.0));
  students.add(Student('Мария', 'Сидорова', 'Группа 204', 4.5));
  students.add(Aspirant('Алексей', 'Иванов', 'Группа 304', 5.0));
  students.add(Aspirant('Елена', 'Козлова', 'Группа 404', 4.2));
  
  // Вызываем getScholarship для каждого элемента
  print('Стипендии студентов и аспирантов:');
  for (var student in students) {
    print('${student.firstName} ${student.lastName}: ${student.getScholarship()} руб');
  }
}