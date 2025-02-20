variable "instances" {
  default = ["mysql", "backend", "frontend"]
}

variable "zone_id" {
    default = "Z06637772HACFACTPITQX"  
}
variable "domain_name" {
    default = "hansh123.online"  
}

variable "common_tags" {
    type = map
    default = {
        Project = "expense"
        Environment = "dev"    
    }  
}