abstract interface class FileSystemComponent {
  void Display();
  void Getsize();
}
class File implements FileSystemComponent{
  void Display(){
    print("File Displayed");
  }
  
  void Getsize(){
    print("File Size Calculated");
  }
}

class Directory implements FileSystemComponent{
  
void Display(){
  print("Directory Displayed");
}

void Getsize(){
  print("Directory Size Calculated");
}

void createFile(){
  print('File create');
}

void createDirectory(){
  print('Directory create');
}

void deleteFile(){
  print('File delete');
}

void deleteDirectory(){
  print('Directory delete');
}

}

void main(){

}