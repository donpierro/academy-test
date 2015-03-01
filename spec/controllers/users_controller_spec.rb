require 'rails_helper'

describe UsersController do

  describe 'GET all_users' do
    it 'routes /all_users to users index page' do
      expect(get: 'all_users' ).to route_to(controller: 'users', action: 'index')
    end
  end
end
