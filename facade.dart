// Класс для управления телевизором
class TV {
  bool isOn = false;
  int channel = 1;

  void turnOn() {
    isOn = true;
    print("TV включен.");
  }

  void turnOff() {
    isOn = false;
    print("TV выключен.");
  }

  void setChannel(int newChannel) {
    if (isOn) {
      channel = newChannel;
      print("TV канал: $channel.");
    } else {
      print("Невозможно переключить канал. Телевизор ВЫКЛЮЧЕН.");
    }
  }
}

// Класс для управления аудиосистемой
class AudioSystem {
  bool isOn = false;
  int volume = 50; // Громкость по умолчанию

  void turnOn() {
    isOn = true;
    print("Звук включен");
  }

  void turnOff() {
    isOn = false;
    print("Звук выключен");
  }

  void setVolume(int newVolume) {
    if (isOn) {
      volume = newVolume.clamp(0, 100); // Ограничиваем громкость от 0 до 100
      print("Громкость $volume.");
    } else {
      print("Звук отключен.");
    }
  }
}

// Класс для управления DVD-проигрывателем
class DVDPlayer {
  bool isPlaying = false;

  void play() {
    isPlaying = true;
    print("DVD сейчас воспроизводится.");
  }

  void pause() {
    if (isPlaying) {
      isPlaying = false;
      print("DVD сейчас на паузе.");
    } else {
      print("Невозможно сделать паузу. DVD не воспроизводится.");
    }
  }

  void stop() {
    if (isPlaying) {
      isPlaying = false;
      print("Воспроизведение DVD остановлено.");
    } else {
      print("Невозможно остновить. DVD не воспроизводится.");
    }
  }
}

// Класс для управления игровой консолью
class GameConsole {
  bool isOn = false;
  bool isGameRunning = false;

  void turnOn() {
    isOn = true;
    print("Game console включен.");
  }

  void turnOff() {
    isOn = false;
    isGameRunning = false;
    print("Game console выключен.");
  }

  void startGame() {
    if (isOn) {
      isGameRunning = true;
      print("Старт игры.");
    } else {
      print("Невозможно начать игру. Game console выключен.");
    }
  }
}

// объединяет управление всеми подсистемами

// Класс HomeTheaterFacade для управления всеми подсистемами
class HomeTheaterFacade {
  final TV tv;
  final AudioSystem audioSystem;
  final DVDPlayer dvdPlayer;
  final GameConsole gameConsole;

  HomeTheaterFacade({
    required this.tv,
    required this.audioSystem,
    required this.dvdPlayer,
    required this.gameConsole,
  });

  // Метод для включения всей системы для просмотра фильма
  void watchMovie() {
    print("Вклюение домашнего кино театра");
    tv.turnOn();
    tv.setChannel(1); // Устанавливаем канал для фильма
    audioSystem.turnOn();
    audioSystem.setVolume(70); // Устанавливаем комфортный уровень громкости
    dvdPlayer.play(); // Запуск фильма
    print("фильм готов к просмотру!");
  }

  // Метод для выключения всей системы
  void endMovie() {
    print("Выключнение домашнего кино театра...");
    dvdPlayer.stop();
    tv.turnOff();
    audioSystem.turnOff();
    print("Домашний кино театр выключен.");
  }

  // Метод для запуска игровой консоли
  void playGame() {
    print("Настройка игрового пространства");
    tv.turnOn();
    tv.setChannel(2); // Устанавливаем канал для игровой консоли
    audioSystem.turnOn();
    audioSystem.setVolume(50); // Устанавливаем громкость для игры
    gameConsole.turnOn();
    gameConsole.startGame(); // Запуск игры
    print("Настройка игры закончена. Удачной Игры!");
  }
}

// Пример использования класса HomeTheaterFacade
void main() {
  TV tv = TV();
  AudioSystem audioSystem = AudioSystem();
  DVDPlayer dvdPlayer = DVDPlayer();
  GameConsole gameConsole = GameConsole();

  // Создание фасада для домашнего кинотеатра
  HomeTheaterFacade homeTheater = HomeTheaterFacade(
    tv: tv,
    audioSystem: audioSystem,
    dvdPlayer: dvdPlayer,
    gameConsole: gameConsole,
  );

  // Включаем систему для просмотра фильма
  homeTheater.watchMovie();

  // Выключаем систему
  homeTheater.endMovie();

  // Запускаем игровую консоль
  homeTheater.playGame();
}

