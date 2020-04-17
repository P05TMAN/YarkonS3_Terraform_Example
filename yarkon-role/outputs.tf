# Role outputs
output "yarkon_role_arn" {
  value = aws_iam_role.yarkon_console_role.arn
}

output "yarkon_role_name" {
  value = aws_iam_role.yarkon_console_role.name
}

output "yarkon_profile_name" {
  value = aws_iam_instance_profile.yarkon_console_profile.name
}
