terraform {
  backend "gcs"{
    bucket      = "terraform_state_lock_beltrame"
    prefix      = "dev/instance1"
    credentials = "../../../auth/noted-tide-300823-c2d06219334a.json"
  }
}