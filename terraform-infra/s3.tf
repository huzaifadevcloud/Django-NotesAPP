resource "aws_s3_bucket" "django_app_bucket" {
    bucket = "${var.my_enviroment}-django-app-bucket-d"
    tags = {
            Name = "${var.my_enviroment}-django-app-bucket-d"
        }
}