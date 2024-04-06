import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:front_end/models/transaction.dart';
import 'package:front_end/screens/deposit/deposit_main.dart';
import 'package:front_end/screens/transaction/deposit.dart';
import 'package:front_end/screens/home/dashboard.dart';
import 'package:front_end/screens/auth/login.dart';
import 'package:front_end/screens/transaction/pay.dart';
import 'package:front_end/screens/settings/profile.dart';
import 'package:front_end/screens/settings/setting.dart';
import 'package:front_end/screens/transaction/send/send.dart';
import 'package:front_end/screens/transaction/transaction_history.dart';
import 'package:front_end/screens/transaction/transfer.dart';

import 'dart:math' as math;

// bottom navigation provider to track current page
final currentIndexProvider = StateProvider<int>((ref) => 0);

class Home extends ConsumerStatefulWidget {
  const Home({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => HomeState();
}

class HomeState extends ConsumerState<Home> {
  // static const _actionTitles = ['Create Post', 'Upload Photo', 'Upload Video'];
  static const FloatingActionButtonLocation centerDocked =
      _CenterDockedFloatingActionButtonLocation();

  void _showPage(int position) {
    ref.read(currentIndexProvider.notifier).state = position;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButtonLocation: centerDocked,
        floatingActionButton: ExpandableFab(
          distance: 112,
          children: [
            expandableButtons(Icons.send, "Pay", 8),
            expandableButtons(Icons.payment, "Send Money", 7),
            expandableButtons(Icons.money, "Transfer Money", 6),
            expandableButtons(Icons.qr_code, "Deposit", 5),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          // unselectedItemColor: Colors.black54,
          // selectedItemColor: Colors.black,
          // unselectedLabelStyle: const TextStyle(color: Colors.red),
          currentIndex: ref.watch(currentIndexProvider) > 4
              ? 2
              : ref.watch(currentIndexProvider),
          onTap: (value) =>
              ref.read(currentIndexProvider.notifier).state = value,
          // backgroundColor: const Color.fromARGB(221, 31, 30, 30),
          items: bottomNavigationBarItems,
        ),
        body: _buildBody());
  }

  Row expandableButtons(IconData iconData, String lable, int page) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ActionButton(
          onPressed: () => _showPage(page),
          icon: Icon(iconData),
        ),
        const SizedBox(
          width: 10.0,
        ),
        Text(lable)
      ],
    );
  }

// the pages to be dispalyed once the bottom nav items or the expandable action buttons clicked.
  Widget _buildBody() {
    switch (ref.watch(currentIndexProvider)) {
      case 0:
        return Dashboard();
      case 1:
        return const TransactionHistory();
      case 2:
        return const Login();
      case 3:
        return const Setting();
      case 4:
        return const Profile();
      case 5:
        return const DepositMain();
      case 6:
        return const Transfer();
      case 7:
        return const Send();
      default:
        return const Pay();
    }
  }
}

//bottom navigation menu items

List<BottomNavigationBarItem> get bottomNavigationBarItems {
  return const [
    BottomNavigationBarItem(
        icon: Icon(
          Icons.home,
        ),
        // label: "Home"),
        label: ""),
    BottomNavigationBarItem(
        icon: Icon(
          Icons.history,
        ),
        // label: "Transactions"),
        label: ""),
    BottomNavigationBarItem(
        icon: Icon(
          Icons.send,
          size: 0.0,
        ),
        label: ""),
    BottomNavigationBarItem(
        icon: Icon(
          Icons.settings,
        ),
        label: ""),
    // label: "Setting"),
    BottomNavigationBarItem(
        icon: Icon(
          Icons.person,
        ),
        // label: "Profile")
        label: "")
  ];
}

// for aligning the fav button
class _CenterDockedFloatingActionButtonLocation
    extends _DockedFloatingActionButtonLocation {
  const _CenterDockedFloatingActionButtonLocation();

  @override
  Offset getOffset(ScaffoldPrelayoutGeometry scaffoldGeometry) {
    final double fabX = (scaffoldGeometry.scaffoldSize.width -
            scaffoldGeometry.floatingActionButtonSize.width) /
        1.5;
    return Offset(fabX, getDockedY(scaffoldGeometry));
  }
}

abstract class _DockedFloatingActionButtonLocation
    extends FloatingActionButtonLocation {
  const _DockedFloatingActionButtonLocation();

  @protected
  double getDockedY(ScaffoldPrelayoutGeometry scaffoldGeometry) {
    final double contentBottom = scaffoldGeometry.contentBottom;
    final double appBarHeight = scaffoldGeometry.bottomSheetSize.height;
    final double fabHeight = scaffoldGeometry.floatingActionButtonSize.height;
    final double snackBarHeight = scaffoldGeometry.snackBarSize.height;

    double fabY = contentBottom - fabHeight / 4.0;

    // Adjust fabY to accommodate SnackBar
    if (snackBarHeight > 0.0) {
      fabY = math.min(
        fabY,
        contentBottom -
            snackBarHeight -
            fabHeight -
            kFloatingActionButtonMargin,
      );
    }

    // Adjust fabY to accommodate AppBar
    if (appBarHeight > 0.0) {
      fabY = math.min(
        fabY,
        contentBottom - appBarHeight - fabHeight / 3.0,
      );
    }

    // Ensure FloatingActionButton doesn't go off-screen
    final double maxFabY = scaffoldGeometry.scaffoldSize.height - fabHeight;
    return math.min(maxFabY, fabY);
  }
}

@immutable
class ExpandableFab extends StatefulWidget {
  const ExpandableFab({
    super.key,
    this.initialOpen,
    required this.distance,
    required this.children,
  });

  final bool? initialOpen;
  final double distance;
  final List<Widget> children;

  @override
  State<ExpandableFab> createState() => _ExpandableFabState();
}

class _ExpandableFabState extends State<ExpandableFab>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _expandAnimation;
  bool _open = false;

  @override
  void initState() {
    super.initState();
    _open = widget.initialOpen ?? false;
    _controller = AnimationController(
      value: _open ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 250),
      vsync: this,
    );
    _expandAnimation = CurvedAnimation(
      curve: Curves.fastOutSlowIn,
      reverseCurve: Curves.easeOutQuad,
      parent: _controller,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggle() {
    setState(() {
      _open = !_open;
      if (_open) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Stack(
        alignment: const Alignment(0, 1),
        // alignment: Alignment(0.7, -0.5),
        clipBehavior: Clip.none,
        children: [
          _buildTapToCloseFab(),
          ..._buildExpandingActionButtons(),
          _buildTapToOpenFab(),
        ],
      ),
    );
  }

  Widget _buildTapToCloseFab() {
    return SizedBox(
      width: 56,
      height: 56,
      child: Center(
        child: Material(
          shape: const CircleBorder(),
          clipBehavior: Clip.antiAlias,
          elevation: 4,
          child: InkWell(
            onTap: _toggle,
            child: const Padding(
              padding: EdgeInsets.all(8),
              child: Icon(
                Icons.close,
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildExpandingActionButtons() {
    final children = <Widget>[];
    final count = widget.children.length;
    final step = widget.distance / (count - 1);
    for (var i = 0; i < count; i++) {
      final offsetX = MediaQuery.of(context).size.width / 2.3;
      // final offsetY = step * i;
      final offsetY = -80.0 + (50.0 * (i + 1));

      children.add(
        _ExpandingActionButton(
          offsetX: offsetX,
          offsetY: offsetY,
          maxDistance: widget.distance,
          progress: _expandAnimation,
          child: widget.children[i],
        ),
      );
    }
    return children;
  }

  Widget _buildTapToOpenFab() {
    return IgnorePointer(
      ignoring: _open,
      child: AnimatedContainer(
        transformAlignment: Alignment.center,
        transform: Matrix4.diagonal3Values(
          _open ? 0.7 : 1.0,
          _open ? 0.7 : 1.0,
          1.0,
        ),
        duration: const Duration(milliseconds: 250),
        curve: const Interval(0.0, 0.5, curve: Curves.easeOut),
        // margin: const EdgeInsets.only(right: 16.0, bottom: 16.0),
        child: AnimatedOpacity(
          opacity: _open ? 0.0 : 1.0,
          curve: const Interval(0.25, 1.0, curve: Curves.easeInOut),
          duration: const Duration(milliseconds: 250),
          child: FloatingActionButton(
            // backgroundColor: Colors.black87,
            onPressed: _toggle,
            child: const Icon(Icons.arrow_upward),
          ),
        ),
      ),
    );
  }
}

@immutable
class _ExpandingActionButton extends StatelessWidget {
  const _ExpandingActionButton({
    required this.offsetX,
    required this.offsetY,
    // required this.directionInDegrees,
    required this.maxDistance,
    required this.progress,
    required this.child,
  });
  final double offsetX;
  final double offsetY;
  // final double directionInDegrees;
  final double maxDistance;
  final Animation<double> progress;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: progress,
      builder: (context, child) {
        // final offset = Offset.fromDirection(
        //   directionInDegrees * (math.pi / 270.0),
        //   progress.value * maxDistance,
        // );
        return Positioned(
          left: 4.0 + offsetX,
          bottom: 100.0 + offsetY,
          child: Transform.rotate(
            angle: (1 - progress.value) * math.pi / 2,
            // origin: const Offset(.29, .5),
            child: child!,
          ),
        );
      },
      child: FadeTransition(
        opacity: progress,
        child: child,
      ),
    );
  }
}

@immutable
class ActionButton extends StatelessWidget {
  const ActionButton({
    super.key,
    this.onPressed,
    required this.icon,
  });

  final VoidCallback? onPressed;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Material(
      shape: const CircleBorder(),
      clipBehavior: Clip.antiAlias,
      // color: theme.colorScheme.secondary,
      elevation: 4,
      child: IconButton(
        onPressed: onPressed,
        icon: icon,
        // color: theme.colorScheme.onSecondary,
      ),
    );
  }
}

@immutable
class FakeItem extends StatelessWidget {
  const FakeItem({
    super.key,
    required this.isBig,
  });

  final bool isBig;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
      height: isBig ? 128 : 36,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        color: Colors.grey.shade300,
      ),
    );
  }
}
