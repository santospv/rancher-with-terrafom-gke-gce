resource "null_resource" "docker" {
  connection {
    host        = google_compute_address.static.address
    type        = "ssh"
    user        = var.user
    timeout     = "500s"
    private_key = file(var.privatekeypath)
  }
  provisioner "remote-exec" {
    inline = [
        "curl -fsSL https://get.docker.com | bash",
        "exit"
    ]
  }
  depends_on = [google_compute_instance.rancher_host]
}

resource "null_resource" "kubectl" {
  connection {
    host        = google_compute_address.static.address
    type        = "ssh"
    user        = var.user
    timeout     = "500s"
    private_key = file(var.privatekeypath)
  }

  provisioner "file" {
    source      = "./install_kubectl.sh"
    destination = "/tmp/install_kubectl.sh"
  }

  provisioner "remote-exec" {
    inline = [
        "sudo chmod +x /tmp/install_kubectl.sh",
        "sh /tmp/install_kubectl.sh",
    ]
  }
  depends_on = [null_resource.docker]
}
resource "null_resource" "rancher" {
  connection {
    host        = google_compute_address.static.address
    type        = "ssh"
    user        = var.user
    timeout     = "500s"
    private_key = file(var.privatekeypath)
  }

  provisioner "file" {
    source      = "./install_rancher.sh"
    destination = "/tmp/install_rancher.sh"
  }

  provisioner "remote-exec" {
    inline = [
        "sudo chmod +x /tmp/install_rancher.sh",
        "sh /tmp/install_rancher.sh",
    ]
  }
  depends_on = [null_resource.kubectl]
}