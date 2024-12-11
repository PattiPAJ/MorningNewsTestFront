variable "token" {
  type        = string
  description = "gitlab token to connect github repo"
  default     = "glpat-YzoxCm86MQp1OmV4YmV6LD95dxTB2LBS82k15Aq8MRA.1706yzrrh"
}

variable "repository" {
  type        = string
  description = "github repo url"
  default     = "https://gitlab.com/patti.ajavon1/morningnewstestfront.git"
}

variable "app_name" {
  type        = string
  description = "Morning News Test Front"
  default     = "morningnewstestfront"
}

variable "branch_name" {
  type        = string
  description = "Morning News Repo Branch Name"
  default     = "main"
}


variable "domain_name" {
  type        = string
  default     = "morningnewstestfront.com"
  description = "Morning News Test Front Domain Name"
}