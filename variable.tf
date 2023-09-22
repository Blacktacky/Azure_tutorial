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
variable "kubernetes_cluster_name"{
type=string
default="kuburnetes_tutorial"
}
variable "node_pool"{
type=number
default=1
}
variable "vm_size"{
type=string
default="Standard_D2_v2"
}
variable "system"
type=string
default="SystemAssigned"
}
variable "environment"{
type=string
default= "Production"
}

