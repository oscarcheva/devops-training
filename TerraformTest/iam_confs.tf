resource "aws_iam_user" "test_user" {
  name = "terraformUser"
}

resource "aws_iam_user_policy" "lb_ro" {
  name = "demo-user-policy"
  user = aws_iam_user.test_user.name

  policy = file("./iam_policy_user.json")
}