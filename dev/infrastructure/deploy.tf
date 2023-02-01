module "cc_infrastructure_setup" {
  source = "../../modules/infrastructure"
}

module "cfk_setup_operator" {
  source = "../../modules/cfk/operator-deploy"
  licenseKey = "license"

  depends_on = [
    module.cc_infrastructure_setup
  ]
}

module "cfk_setup_connect" {
  source = "../../modules/cfk/connect-deploy"

  depends_on = [
    module.cfk_setup_operator
  ]
}