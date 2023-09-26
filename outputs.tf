output "student_names" {
  value = [for student in locals.batch06_students: student]
}
