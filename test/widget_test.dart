import 'package:flutter_test/flutter_test.dart';
import 'package:myportofolio_mobile/main.dart';

void main() {
  testWidgets('MyPortfolio smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that the title and identity cards are displayed.
    expect(find.text('MyPortfolio'), findsOneWidget);
    expect(find.text('2506623490'), findsOneWidget);
    expect(find.text('M. Naufal Rizki'), findsOneWidget);
    expect(find.text('PBP B'), findsOneWidget);

    // Verify that the action buttons are displayed.
    expect(find.text('Lihat Proyek'), findsOneWidget);
    expect(find.text('Tambah Proyek'), findsOneWidget);
    expect(find.text('Tambah Pengalaman'), findsOneWidget);
    expect(find.text('Logout'), findsOneWidget);
  });
}
