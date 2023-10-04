output "student_names" {
  value = [for student in local.batch06_students: student]
}

output "rainbow_ops" {
  value = [for rainbow in local.rainbow_ops: rainbow]
}
