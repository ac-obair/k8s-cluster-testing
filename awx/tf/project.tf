resource "awx_project" "ansible-monolith" {
  name                 = "ansible-monolith"
  description          = "all-the-ansible added by tf"
  scm_type             = "git"
  scm_url              = "git@github.com:arnoldclark/ansible.git"
  scm_branch           = "master"
  scm_update_on_launch = true
  scm_credential_id    = awx_credential_scm.test-credentail-as-me.id
  organisation_id      = awx_organization.arnoldclark.id
}