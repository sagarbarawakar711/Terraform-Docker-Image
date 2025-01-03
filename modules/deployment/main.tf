resource "null_resource" "make_script_executable" {
  provisioner "local-exec" {
    command = "chmod +x update_argocd.sh" 
    working_dir = "/mnt/d/Terraform-Docker"  
  }
}

resource "null_resource" "update_deployment_file" {
  depends_on = []
  triggers = {
    always_run = "${timestamp()}"
  }
  
  provisioner "local-exec" {
    command = "./update_argocd.sh"  
    working_dir = "/mnt/d/Terraform-Docker"
  }
}
