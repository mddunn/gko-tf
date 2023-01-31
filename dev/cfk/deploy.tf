module "cfk_setup_operator" {
  source = "../../modules/cfk/operator-deploy"
  licenseKey = "license"
}

module "cfk_setup_connect" {
  source = "../../modules/cfk/connect-deploy"
}

module "cfk_setup_connector" {
  source = "../../modules/cfk/connector-deploy"
}