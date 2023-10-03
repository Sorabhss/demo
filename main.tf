provider "google" {
  project = "YOUR_PROJECT_ID"
  region  = "us-central1"
  zone    = "us-central1-a"
}

// First Compute instance
resource "google_compute_instance" "vm_instance_1" {
  name         = "rhel-instance-1"
  machine_type = "custom-16-32768"  // 16 vCPU, 32GB RAM

  boot_disk {
    initialize_params {
      image = "rhel-cloud/rhel-8-latest"
    }
  }

  network_interface {
    network = "default"
  }
}

// Second Compute instance
resource "google_compute_instance" "vm_instance_2" {
  name         = "rhel-instance-2"
  machine_type = "custom-4-8192"  // 4 vCPU, 8GB RAM

  boot_disk {
    initialize_params {
      image = "rhel-cloud/rhel-8-latest"
    }
  }

  network_interface {
    network = "default"
  }
}

// Storage - SSD Block storage for the first instance
resource "google_compute_disk" "ssd_disk_1" {
  name  = "ssd-disk-1"
  type  = "pd-ssd"
  size  = 128
  zone  = "us-central1-a"
  image = "rhel-cloud/rhel-8-latest"
}

// ... This pattern would continue for other resources ...

