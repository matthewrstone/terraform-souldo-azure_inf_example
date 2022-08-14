variable "cidr" {
    description = "The CIDR block (0.0.0.0/0) for the Resource Group."
    default = "10.253.252.0/24"
}

variable "name" {
    description = "The name of the project (keep it short)"
    default = "souldo"
}

variable "environment" {
    description = "Development | Production"
    default = "development"
  
}

variable "region" {
    description = "The Azure location to build in."
    default = "centralus"
}

variable "azure_ssh_public_key" {
  default = ""
}