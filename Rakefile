workflows_home=File.expand_path("~/Library/Application Support/Alfred/Alfred.alfredpreferences/workflows")
bundle_id = "center.planning.pco-alfred"

desc "Link this dir to Alfred workflows dir for development"
task :link_to_alfred do
  FileUtils.ln_sf(Dir.pwd, File.join(workflows_home, bundle_id))
end

desc "Unlink this dir from Alfred workflow dir"
task :unlink_from_alfred do
  rm File.join(workflows_home, bundle_id)
end
