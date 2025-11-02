void main() {
  fetchPost().then((post) {
    print("Resolved to post =$post");
  });
}

Future<Post> fetchPost() {
  const delay = Duration(seconds: 3);

  return Future.delayed(delay, () {
    return Post('my post', 123);
  });
}

class Post {
  String title;
  int userId;

  Post(this.title, this.userId);

  @override
  String toString() {
    return "Post($userId, $title)";
  }
}
