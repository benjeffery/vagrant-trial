application "keposeda" do
  path "/srv/keposeda"
  owner "nobody"
  group "nogroup"
  repository "https://github.com/benjeffery/vagrant-trial.git"
  revision "master"
  #migrate true
  packages ["libpq-dev", "git-core",]

  django do 
    packages [] #How do I handle the virtualenv?
    requirements "REQUIREMENTS" #The default is to look in the project root for "requirements.txt"
    settings_template "settings.py.erb"
    debug true
    #collectstatic "build_static --noinput"
    database do
      database "keposeda"
      engine "postgresql_psycopg2"
      username "keposeda"
      password "awesome_password"
    end
    #database_master_role "packaginator_database_master" Not needed.


  end
  
  gunicorn do
      app_module :django
      port 8080
  end



end