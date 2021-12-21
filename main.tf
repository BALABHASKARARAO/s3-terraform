resource "aws_s3_bucket" "testbucket" {
    bucket = var.s3_bucketname
    acl = "private"
}
resource "aws_s3_bucket_object" "base_folder" {
    bucket = var.s3_bucketname
    acl     = "private"
    key     =  "${var.folder_name}/"
    
    depends_on = [aws_s3_bucket.testbucket]
}
## the below is upload file to s3 bucket
resource "aws_s3_bucket_object" "uploadfile" {
  bucket = var.s3_bucketname
  key     = "${var.folder_name}/index.html"
  source = "./index.html"
  depends_on = [aws_s3_bucket.testbucket, aws_s3_bucket_object.base_folder]
}




