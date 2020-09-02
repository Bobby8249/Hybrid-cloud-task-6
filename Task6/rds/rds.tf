resource "aws_db_subnet_group" "default" {
  name       = "main"
  subnet_ids = ["subnet-4b493b07", "subnet-b59f92dd"]
  tags = {
    Name = "My DB subnet group"
  }
}
resource "aws_db_instance" "mydb" {
  allocated_storage    = 10
  storage_type         = "gp2"
  engine               = "mysql"
  engine_version       = "5.7.30"
  instance_class       = "db.t2.micro"
  name                 = "mydb"
  username             = "bobby"
  password             = "redhat123"
  parameter_group_name = "default.mysql5.7"
  publicly_accessible = true
  db_subnet_group_name = "${aws_db_subnet_group.default.name}"
  iam_database_authentication_enabled = true
  skip_final_snapshot = true
  port = "3306"
  tags = {
    "Name" = "database-1"
  }
}
output "ip" {
    value = "${aws_db_instance.mydb.address}"
  }