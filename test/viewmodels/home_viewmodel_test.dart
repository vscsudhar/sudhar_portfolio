import 'package:flutter_test/flutter_test.dart';
import 'package:sudhar_portfolio/app/app.locator.dart';
import 'package:sudhar_portfolio/ui/views/home/home_viewmodel.dart';
import '../helpers/test_helpers.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  HomeViewModel getModel() => HomeViewModel();


  group('HomeViewModelTest -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());

    test('Initial active nav index is 0', () {
      final model = getModel();
      expect(model.activeNavIndex, 0);
    });

    test('setActiveNavIndex updates activeNavIndex correctly', () {
      final model = getModel();
      model.setActiveNavIndex(2);
      expect(model.activeNavIndex, 2);
    });

    test('scrollToWork updates activeNavIndex to 2', () {
      final model = getModel();
      model.scrollToWork();
      expect(model.activeNavIndex, 2);
    });

    test('scrollToContact updates activeNavIndex to 4', () {
      final model = getModel();
      model.scrollToContact();
      expect(model.activeNavIndex, 4);
    });
  });
}

