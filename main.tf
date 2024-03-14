# Auth method: Domain-wide delegation and user impersonation
provider "googleworkspace" {
  credentials             = "YOUR_JSON_FILE_HERE"
  customer_id             = "YOUR_CUSTOMER_ID_HERE"
  impersonated_user_email = "YOUR_USER_HERE"
  oauth_scopes = [
	"https://www.googleapis.com/auth/admin.directory.group"
  ]
}

resource "googleworkspace_group" "sales" {
  email       = "sales@YOUR_DOMAIN.com"
  name        = "Sales"
  description = "Sales Group"

  aliases = ["paper-sales@YOUR_DOMAIN.com", "sales-dept@YOUR_DOMAIN.com"]

  timeouts {
    create = "1m"
    update = "1m"
  }
}

resource "googleworkspace_group_member" "manager" {
  group_id = googleworkspace_group.sales.id
  email    = "USER@YOUR_DOMAIN.com"

  role = "MANAGER"
}
