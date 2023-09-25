variable "subscription_id"{
type=string
}
variable "client_id"{
type=string
}
variable "client_secret"{
type=string
}
variable "tenant_id"{
type=string
}
variable "prefix"{
type=string
default= "azure_tutorial"
}
variable "storage_account_name"{
type=string
default= "azure_tutorial"
}
variable "env"{
type=string
default= "dev"
}
variable "kube_name"{
  type=string
  default="example_aks1"
}
variable "kube_dns"{
  type=string
  default="exampleaks1"
}
variable "pool_name"{
  type=string
  default="default"
}
variable "vm_size"{
  type=string
  default="Standard_D2_v2"
}
variable "kube_identity"{
  type=string
  default="SystemAssigned"
}
variable "kube_env"{
  type=string
  default="Production"
}
variable "node_count"{
  type=number
  default=1
}
variable "cert_sensitive"{
  type=bool
  default=true
}
variable "kube_sensitive"{
  type=bool
  default=true
}
variable "ip_name"{
  type=string
  default="PublicIPForLB"
}
variable "method_allocation"{
  type=string
  default="Dynamic"
}
variable "lb_name"{
  type=string
  default="TestLoadBalancer"
}
variable "ipconfig_name"{
  type=string
  default="PublicIPAddress"
}
variable "vn_name"{
  type=string
  default="example_network"
}
variable "subnet_front"{
  type=string
  default="frontend"
}
variable "subnet_back"{
  type=string
  default="backend"
}
