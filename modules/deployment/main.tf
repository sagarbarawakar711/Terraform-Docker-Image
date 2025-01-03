resource "null_resource" "make_script_executable" {
  provisioner "local-exec" {
    command = "chmod +x /home/runner/work/Terraform-Docker-Image/Terraform-Docker-Image/update_argocd.sh" 
    working_dir = "/home/runner/work/Terraform-Docker-Image/Terraform-Docker-Image"  
  }
}

resource "null_resource" "update_deployment_file" {
  depends_on = []
  triggers = {
    always_run = "${timestamp()}"
  }
  
  provisioner "local-exec" {
    command = "./update_argocd.sh"  
    working_dir = "/home/runner/work/Terraform-Docker-Image/Terraform-Docker-Image"
  }
}
