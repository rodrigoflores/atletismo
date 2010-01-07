set :user, "rlmf"
set :domain, "rodrigoflores.org"
set :project, "atletismo"
set :application, "Atletismo"
set :repository,  "bzr+ssh://repositorio/atletismo"
set :applicationdir, "/home/#{user}/#{application}"
set :scm, :bzr
# If you aren't deploying to /u/apps/#{application} on the target
# servers (which is the default), you can specify the actual location
# via the :deploy_to variable:

# If you aren't using Subversion to manage your source code, specify
# your SCM below:
# set :scm, :subversion

role :app, domain
role :web, domain
role :db,  domain, :primary => true


set :deploy_to, applicationdir
set :deploy_via, :export

set :chmod755, "app config db lib public vendor script script/* public/disp*"
set :use_sudo, false

