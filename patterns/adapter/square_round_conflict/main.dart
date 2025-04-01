/// EN: Somewhere in client code...
///
/// RU: Где-то в клиентском коде...
void main() {
  // EN: Round fits round, no surprise.
  //
  // RU: Круглое к круглому — всё работает.
  final hole = RoundHole(5);
  final peg = RoundPeg(5);

  if (hole.fits(peg)) {
    print("Round peg r5 fits round hole r5.");
  }

  final smallSqPeg = SquarePeg(2);
  final largeSqPeg = SquarePeg(20);
  // EN: hole.fits(smallSqPeg); // Won't compile.
  //
  // RU: hole.fits(smallSqPeg); // Не скомпилируется.

  // EN: Adapter solves the problem.
  //
  // RU: Адаптер решит проблему.
  final smallSqPegAdapter = SquarePegAdapter(smallSqPeg);
  final largeSqPegAdapter = SquarePegAdapter(largeSqPeg);

  if (hole.fits(smallSqPegAdapter)) {
    print("Square peg w2 fits round hole r5.");
  }

  if (!hole.fits(largeSqPegAdapter)) {
    print("Square peg w20 does not fit into round hole r5.");
  }
}

class RoundPeg {
  final int radius;

  RoundPeg(this.radius);
}

class SquarePegAdapter implements RoundPeg {
  final SquarePeg squarePeg;

  SquarePegAdapter(this.squarePeg);

  @override
  int get radius => squarePeg.width;
}

class SquarePeg {
  final int width;

  SquarePeg(this.width);
}

class RoundHole {
  final int radius;

  RoundHole(this.radius);

  bool fits(RoundPeg roundPeg) => radius >= roundPeg.radius;
}
