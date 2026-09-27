resource "random_password" "password__tenants" {
  for_each = local.tenants

  length = 24

  special          = true
  override_special = "_-."

  min_upper   = 2
  min_lower   = 2
  min_special = 2
}
