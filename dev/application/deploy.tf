module "cc_application_setup" {
  source = "../../modules/application"
}

module "cfk_setup_connector" {
  source = "../../modules/cfk/connector-deploy"

  depends_on = [
    module.cc_application_setup
  ]
}