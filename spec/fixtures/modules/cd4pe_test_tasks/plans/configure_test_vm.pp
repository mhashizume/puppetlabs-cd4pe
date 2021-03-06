plan cd4pe_test_tasks::configure_test_vm (
  TargetSpec $targets,
  Hash       $root_config,
  Hash       $user_config,
  Hash       $workspace_config,
  Hash       $vcs_config,
) {

  run_task('cd4pe::root_configuration',          $targets, $root_config)
  run_task('cd4pe_test_tasks::test_connection',  $targets)

  run_task('cd4pe::create_user',                 $targets, $user_config)
  run_task('cd4pe::create_workspace',            $targets, $workspace_config)

  unless empty($vcs_config) {
    run_task('cd4pe::add_vcs_integration',       $targets, $vcs_config)
  }
}