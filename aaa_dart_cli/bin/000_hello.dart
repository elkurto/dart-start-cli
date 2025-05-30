void main(List<String> arguments) {
  if (arguments.isEmpty) {
    print("Hello");
  } else {
    print("Hello ${arguments.join(", ")}");
  }
}
