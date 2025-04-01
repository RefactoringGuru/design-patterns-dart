import 'src/compression_decorator.dart';
import 'src/data_source.dart';
import 'src/data_source_decorator.dart';
import 'src/encryption_decorator.dart';
import 'src/file_data_source.dart';

void main() {
  final records = 'Name,Salary\nJohn Smith,100000\nSteven Jobs,912000';

  // Create encrypt file
  DataSourceDecorator encoded = CompressionDecorator(
    EncryptionDecorator(
      FileDataSource('Secret.txt'),
    ),
  );
  encoded.writeData(records);

  DataSource plain = FileDataSource('Secret.txt');
  print("- Input ----------------");
  print(records);
  print("\n- Encoded --------------");
  print(plain.readData());
  print("\n- Decoded --------------");
  print(encoded.readData());
}
