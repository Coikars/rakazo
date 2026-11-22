import 'package:flutter_test/flutter_test.dart';
import 'package:ava/main.dart';
void main() { testWidgets('shows Ava launcher', (tester) async { await tester.pumpWidget(const AvaApp()); expect(find.text('Ava'), findsOneWidget); expect(find.text('Open Rakazo'), findsOneWidget); }); }
