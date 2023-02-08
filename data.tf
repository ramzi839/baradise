locals {
  dist = "centos"
  release = [7]
  project = "centos"

}

data "google_compute_image" "centos-image" {  
  for_each = toset([for i in local.release : tostring(i)]) 
  family  = "centos-${each.value}"
  project = "centos-cloud"
}

data "local_file" "startup" {
    filename = "/Users/mramzi/learn/gcp/ace/compute_engine/httpd_install.sh"
}