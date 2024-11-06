// Абстрактный класс для компонентов файловой системы
abstract class FileSystemComponent {
  String name;

  FileSystemComponent(this.name);

  // Метод для вывода информации о компоненте
  void displayInfo(int indentation);

  // Метод для получения размера компонента
  int getSize();
}

// Класс для файлов
class File extends FileSystemComponent {
  int size;

  File(String name, this.size) : super(name);

  @override
  void displayInfo(int indentation) {
    print('${' ' * indentation}- File: $name, Size: $size bytes');
  }

  @override
  int getSize() => size;
}

// Класс для папок
class Directory extends FileSystemComponent {
  final List<FileSystemComponent> _components = [];

  Directory(String name) : super(name);

  // Метод для добавления компонента в папку
  void add(FileSystemComponent component) {
    if (!_components.contains(component)) {
      _components.add(component);
      print('Added ${component.name} to $name.');
    } else {
      print('${component.name} already exists in $name.');
    }
  }

  // Метод для удаления компонента из папки
  void remove(FileSystemComponent component) {
    if (_components.contains(component)) {
      _components.remove(component);
      print('Removed ${component.name} from $name.');
    } else {
      print('${component.name} not found in $name.');
    }
  }

  @override
  void displayInfo(int indentation) {
    print('${' ' * indentation}+ Directory: $name');
    for (var component in _components) {
      component.displayInfo(indentation + 2);
    }
  }

  @override
  int getSize() {
    int totalSize = 0;
    for (var component in _components) {
      totalSize += component.getSize();
    }
    return totalSize;
  }
}

// Пример клиентского кода
void main() {
  // Создаем файлы
  File file1 = File('File1.txt', 100);
  File file2 = File('File2.txt', 200);
  File file3 = File('File3.txt', 300);

  // Создаем папки
  Directory rootDirectory = Directory('Root');
  Directory subDirectory1 = Directory('SubFolder1');
  Directory subDirectory2 = Directory('SubFolder2');

  // Создаем иерархию файлов и папок
  rootDirectory.add(file1);
  rootDirectory.add(subDirectory1);
  rootDirectory.add(subDirectory2);

  subDirectory1.add(file2);
  subDirectory2.add(file3);

  // Выводим содержимое иерархии
  print('File System Structure:');
  rootDirectory.displayInfo(0);

  // Выводим общий размер файловой системы
  print('\nTotal size of file system: ${rootDirectory.getSize()} bytes');
}

// тут чуток помог chat gpt ))))