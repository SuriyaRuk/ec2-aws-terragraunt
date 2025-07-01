resource "aws_key_pair" "this" {
  key_name   = var.key_name
  public_key = var.public_key
  # key_type   = "ECDSA"

  tags = merge(
    {
      Name = var.key_name
    },
    var.tags
  )
}

