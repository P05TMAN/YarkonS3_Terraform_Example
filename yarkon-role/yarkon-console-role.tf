# Yarkon Console Role

resource "aws_iam_role" "yarkon_console_role" {
  name               = "yarkon_console"
  assume_role_policy = file("prod-policies/assume-role-policy.json")
}

resource "aws_iam_policy" "yarkon_console_policy" {
  name        = "yarkon_console_policy"
  description = "Yarkon Server Console Policy"
  policy      = file("prod-policies/yarkon-console-policy.json")
}

resource "aws_iam_policy_attachment" "yarkon_console_attach" {
  name         = "yarkon_console_policy_attachment"
  roles        = ["${aws_iam_role.yarkon_console_role.name}"]
  policy_arn   = aws_iam_policy.yarkon_console_policy.arn
}

resource "aws_iam_instance_profile" "yarkon_console_profile" {
  name = "yarkon_console"
  role = aws_iam_role.yarkon_console_role.name
}
