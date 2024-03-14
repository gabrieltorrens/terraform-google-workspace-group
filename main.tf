# Auth method: Domain-wide delegation and user impersonation
provider "googleworkspace" {
  credentials             = "YOUR_JSON_FILE_HERE"
  customer_id             = "YOUR_CUSTOMER_ID_HERE"
  impersonated_user_email = "YOUR_USER_HERE"
  oauth_scopes = [
  	"https://www.googleapis.com/auth/gmail.settings.basic",
	"https://www.googleapis.com/auth/gmail.settings.sharing",
	"https://www.googleapis.com/auth/chrome.management.policy",
	"https://www.googleapis.com/auth/cloud-platform",
	"https://www.googleapis.com/auth/admin.directory.customer",
	"https://www.googleapis.com/auth/admin.directory.domain",
	"https://www.googleapis.com/auth/admin.directory.group",
	"https://www.googleapis.com/auth/admin.directory.orgunit",
	"https://www.googleapis.com/auth/admin.directory.rolemanagement",
	"https://www.googleapis.com/auth/admin.directory.userschema",
	"https://www.googleapis.com/auth/admin.directory.user",
	"https://www.googleapis.com/auth/apps.groups.settings"
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
