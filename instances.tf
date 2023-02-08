
resource "google_compute_instance" "default" {
  name         = "test-1-${each.value}"
  machine_type = "e2-micro"
  zone         = "us-west1-b"


  boot_disk {
    initialize_params {
      image = data.google_compute_image.centos-image["7"].self_link
      labels = {
        my_label = "value"

      }
    }
  }

   tags = ["app", "elastic"]

  network_interface {
    network = "default"

    access_config {
      // Ephemeral public IP
    }
  }

  metadata = {
    foo = "bar"
  }

  metadata_startup_script = data.local_file.startup.content

  for_each = {
    "terraform": "value1",
    "resource":  "value2",
    "indexing":  "value3",
    "example":   "value4",
  }


  
}