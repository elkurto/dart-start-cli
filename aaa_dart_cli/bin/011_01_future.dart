void main() async {
  //method 1
  fetchPost().then((post) {
    print("Resolved to post1 =$post");
  });
  // method 2
  Post post2 = await fetchPostAsync();
  print("Resolved to post2 =$post2");

  // method 3
  Post post3 = await fetchPost();
  print("Resolved to post3 =$post3");
}

Future<Post> fetchPostAsync() async {
  final Post post = await fetchPost();
  return post;
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
