require 'aws-sdk-v1'

AWS.config(
  region: ENV['AWS_REGION'].to_str,
  access_key_id: ENV['AWS_ACCESS_KEY_ID'].to_str,
  secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'].to_str
)
