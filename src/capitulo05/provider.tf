provider "google" {
  project     = "project-id"
  credentials = file("/path/para/arquivo")
  region      = "southamerica-east-1"
}
# export GOOGLE_CLOUD_KEYFILE_JSON={{path}} se quiserem remover a entrada de credenciais.
