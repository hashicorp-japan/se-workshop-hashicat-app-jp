# Copyright (c) HashiCorp, Inc.

terraform {
  required_providers {
    tfe = {
      version = "~> 0.40.0"
    }
  }
}

locals {
  deployments = jsondecode(file("${path.module}/list_of_deployments.json"))
}

/**** **** **** **** **** **** **** **** **** **** **** ****
TFCのOrg名をユーザーから取得する。
**** **** **** **** **** **** **** **** **** **** **** ****/

data "tfe_organization" "org" {
  name = var.tfc_organization
}

resource "random_uuid" "id" {
  count = length(local.deployments)
}

resource "random_pet" "pet" {
  length = 3
  count  = length(local.deployments)
}

resource "tfe_project" "hashicat" {
  organization = data.tfe_organization.org.name
  name         = "Vending_Macheen"
}

# /**** **** **** **** **** **** **** **** **** **** **** ****
#  ワークスペースをリモート実行モードで構成し、プランと適用がAPI経由で
#  Terraform Cloudプラットフォームで行われるようにします。
# **** **** **** **** **** **** **** **** **** **** **** ****/

resource "tfe_workspace" "hashicat" {
  count        = length(random_pet.pet)
  name         = random_pet.pet[count.index].id
  organization = data.tfe_organization.org.name
  project_id   = tfe_project.hashicat.id
  description  = local.deployments[count.index].Description
  tag_names = [
    local.deployments[count.index]["Deployment ID"],
    local.deployments[count.index]["Department"],
    local.deployments[count.index]["Product Stack"],
    local.deployments[count.index]["Environment"]
  ]
}
