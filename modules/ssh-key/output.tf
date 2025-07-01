output "key_name" {
  description = "Name of the key pair"
  value       = aws_key_pair.this.key_name
}

output "key_pair_id" {
  description = "The key pair ID"
  value       = aws_key_pair.this.key_pair_id
}

output "fingerprint" {
  description = "The MD5 public key fingerprint"
  value       = aws_key_pair.this.fingerprint
}