void main() {
  String name = 'John Doe';
  String? nickName; // String is a distinct type from String? (nullable String). That's why nickname.length won't compile: the compiler can't promise nickname holds anything.
  late final controller;  // declared, not yet created

  /*
  Two flavors:
    1. late + initializer = lazy: computed on first access, not at declaration
    2. late final = assignable exactly once, later
  */

  // ignore: dead_code
  print(nickName?.isEmpty);

  /*
  Syntax -> Meaning -> Example
  ?. -> access only if not null, otherwise null -> nickname?.length
  ?? -> use left, or right if left is null -> nickname ?? 'none'
  ??= -> assign right only if left is null -> nickname ??= 'none'
  ! -> "I promise it's not null" — crashes if you lied -> nickname!.length
  */

  String display(String? nickname) {
    if (nickname == null) return 'Guest';
    return nickname.toUpperCase();   // ✅ promoted to String here
  }

  print(display(nickName));

  Profile profile = Profile();
  profile.show();


  // Nullable vs required parameters
  // ProductCard({required this.title, this.subtitle});
  // required title → must the caller provide it? yes (and it's non-null String)
  // subtitle (nullable, optional) → can it hold null? yes, and callers may skip it
  // A parameter can be 'required String? bio' — forced to pass, but allowed to pass null.


  // final all = [
  //     header,
  //     ?subtitle,        // null-aware element: skipped entirely if subtitle is null — no `!` needed
  //     ...?extras,       // null-aware spread: spreads only if extras != null
  //     maybeList?[0],    // null-aware index: null if maybeList is null
  //   ];

}

class Profile {
  String? bio;

  void show() {
    final b = bio;
    if (b != null) {
      print(b.length);   // ❌ compile error — why?!
    }
  }
}
