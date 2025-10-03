resource "aws_s3_bucket" "frontend_bucket" {
  bucket = "my-frontend-bucket-12345"
  acl    = "public-read"
  website {
    index_document = "index.html"
  }
}

