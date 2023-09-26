output "student_names" {
  value = [for student in local.batch06_students: student]
}
