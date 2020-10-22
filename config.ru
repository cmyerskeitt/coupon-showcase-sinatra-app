require './config/environment'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

#Here is where I will mount other controllers 'use'

#In order to send Patch and Delete I need this code:
Rack::MethodOverride
use CouponsController
use UsersController
run ApplicationController
