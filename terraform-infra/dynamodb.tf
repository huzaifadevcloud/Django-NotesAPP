resource "aws_dynamodb_table" "django_app_table" {
    name = "${var.my_enviroment}-django-app-table"
    billing_mode = "PAY_PER_REQUEST"
    hash_key = "id"
    attribute {
        name = "id"
        type = "S"
    }
}