resource "github_repository" "githubrepo" {
  name        = "github-tf-repo"
  description = "this repo created using terraform"
  visibility = "public"

}