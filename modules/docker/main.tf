resource "null_resource" "make_script_executable" {
  provisioner "local-exec" {
    command = "chmod +x /home/runner/work/Terraform-Docker-Image/Terraform-Docker-Image/build_docker_image.sh" 
    working_dir = "/home/runner/work/Terraform-Docker-Image/Terraform-Docker-Image"  
  }
}
resource "null_resource" "build_docker_image" {
  depends_on = [null_resource.make_script_executable]  
 triggers = {
    always_run = "${timestamp()}"
  }
  provisioner "local-exec" {
    command = "./build_docker_image.sh"  
    working_dir = "/home/runner/work/Terraform-Docker-Image/Terraform-Docker-Image" 
  }
}



