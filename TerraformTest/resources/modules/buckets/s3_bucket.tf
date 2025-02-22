resource "aws_s3_bucket" "s3-bucket" {
  bucket = var.s3_bucket_name
  lifecycle {
   # prevent_destroy = true ## Avoid terraform destruction
    ## ignore_changes = [bucket] ## Avoid recreating due to manual changes
  }
}
