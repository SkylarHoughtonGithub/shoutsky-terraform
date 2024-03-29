#TODO: Modularize and integrate with eks module
# module "efs" {
#   source = "terraform-aws-modules/efs/aws"

#   # File system
#   name      = "skylab-efs"
#   encrypted = false
#   #   kms_key_arn = "arn:aws:kms:us-east-2:11111111111:key/0232359-bbd4-460b-ad03-fad2badfa84"

#   performance_mode = "generalPurpose"
#   lifecycle_policy = {
#     transition_to_ia = "AFTER_30_DAYS"
#   }

#   # File system policy
#   attach_policy                      = true
#   bypass_policy_lockout_safety_check = false
#   policy_statements = [
#     {
#       sid     = "skylabEFS"
#       actions = ["elasticfilesystem:ClientMount"]
#       principals = [
#         {
#           type        = "AWS"
#           identifiers = ["arn:aws:iam::11111111111:role/admin"]
#         }
#       ]
#     }
#   ]

#   # Mount targets / security group
#   mount_targets = {
#     "mount-1" = {
#       subnet_id = "subnet-d1d1d1d1d1d1d1d12"
#     }
#   }
#   security_group_description = "skylab EFS security group"
#   security_group_vpc_id      = "vpc-2d2d2d2d2d2d2d"
#   security_group_rules = {
#     vpc = {
#       # relying on the defaults provided for EFS/NFS (2049/TCP + ingress)
#       description = "NFS ingress from VPC private subnets"
#       cidr_blocks = var.eks_api_allowed_cidrs
#     }
#   }

#   # Access point(s)
#   access_points = {
#     posix_example = {
#       name = "posix-example"
#       posix_user = {
#         gid            = 1001
#         uid            = 1001
#         secondary_gids = [1002]
#       }

#       tags = {
#         Additionl = "yes"
#       }
#     }
#     root_example = {
#       root_directory = {
#         path = "/example"
#         creation_info = {
#           owner_gid   = 1001
#           owner_uid   = 1001
#           permissions = "755"
#         }
#       }
#     }
#   }

#   # Backup policy
#   enable_backup_policy = true

#   # Replication configuration
#   create_replication_configuration = true
#   replication_configuration_destination = {
#     region = "us-west-1"
#   }

#   tags = {
#     Name        = "skylab-efs"
#     Terraform   = "true"
#     Environment = "dev"
#   }
# }
