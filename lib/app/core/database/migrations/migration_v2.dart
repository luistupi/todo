import 'package:sqflite/sqflite.dart';
import 'package:todo_list_provider/app/core/database/migrations/migration.dart';

class MigrationV2 extends Migration {
  @override
  void create(Batch batch) {
    batch.execute('''
        create table teste2
        (
        id integer 
        )
''');
  }

  @override
  void update(Batch batch) {
    batch.execute('''
      create table teste2
      (
        id integer 
      )
''');
  }
}
