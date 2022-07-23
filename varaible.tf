variable "AWS_REGION" {
default = "us-west-2"
}

variable "AMIS" {
    type = map
    default = {
        us-east-1 = "ami-0b0ea68c435eb488d"
        us-east-2 = "ami-05803413c51f242b7"
        us-west-2 = "ami-0b152cfd354c4c7a4"
        us-west-1 = "ami-0454207e5367abf01"
        ap-south-1 = "ami-0f2e255ec956ade7f"
    }
}

variable "PATH_TO_PUBLIC_KEY" {
  description = "Public key path"
  default = "~/.ssh/id_rsa.pub"
}

variable "PATH_TO_PRIVATE_KEY" {
  default = "~/.ssh/id_rsa"
}

variable "INSTANCE_USERNAME" {
  default = "ubuntu"
}
