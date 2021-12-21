resource "aws_s3_bucket" "testbucket" {
    bucket = var.s3_bucketname
    acl = "private"
}
resource "aws_s3_bucket_object" "base_folder" {
    bucket  = "${aws_s3_bucket.testbucket.id}"
    acl     = "private"
    key     =  "${var.folder_name}/"
}
## the below is upload file to s3 bucket
resource "aws_s3_bucket_object" "uploadfile" {
  bucket = "{var.s3_bucketname/${var.folder_name}/}"
  key     = "index.html"
  source = "./index.html"
  dependens_on = [aws_s3_bucket.testbucket aws_s3_bucket_object.base_folder]
}




