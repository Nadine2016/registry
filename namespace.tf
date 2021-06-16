data "ibm_resource_group" "group" {
     name = "default"
}
   
resource "ibm_cr_namespace" "cr_namespace" {
     name = "mynamespace"
     resource_group_id = data.ibm_resource_group.group.id
}
   
resource "ibm_iam_user_policy" "policy" {
     ibm_id = "user@ibm.com"
     roles  = ["Manager"]

     resources {
       service              = "container-registry"
       resource_instance_id = ibm_cr_namespace.cr_namespace.id
     }
}
