require 'rails_helper'

describe CitiesController do
  let!(:user) { FactoryGirl.create(:user) }

  before(:each) { sign_in(user) }

  describe 'POST create' do
    context 'when valid' do
      it 'creates new city' do
        expect { 
          post :create, city: { name: 'London', short_name: 'Ld' }
        }.to change(City, :count).by(1)
      end

      it 'redirects to the cities list' do
        post :create, city: { name: 'London', short_name: 'Ld' }
        expect(response).to redirect_to(cities_url)
      end

      it 'renders success message' do
        post :create, city: { name: 'London', short_name: 'Ld' }
        expect(controller.flash[:notice]).to eq('City was successfully created.')
      end
    end

    context 'when invalid' do
      it 'does not save city without name' do
        expect { 
          post :create, city: { short_name: 'Ld' }
        }.to change(City, :count).by(0)
      end

      it 'does not save city without short name' do
        expect { 
          post :create, city: { name: 'London' }
        }.to change(City, :count).by(0)
      end

      it 'does not save city with name shorter than 4 characters' do
        expect { 
          post :create, city: { name: 'abc', short_name: 'Ld' }
        }.to change(City, :count).by(0)
      end
    end
  end

  describe 'DELETE destroy' do
    let!(:city) { FactoryGirl.create(:city) }

    it 'deletes requested city from database' do
      expect { 
        delete :destroy, id: city.id
      }.to change(City, :count).by(-1)
    end

    it 'redirects to cities list' do
      delete :destroy, id: city.id
      expect(response).to redirect_to(cities_path)
    end

    it 'renders success message' do
      delete :destroy, id: city.id
      expect(controller.flash[:notice]).to eq('City was successfully deleted.')
    end
  end

  describe 'GET show' do
    let!(:city) { FactoryGirl.create(:city) }
    
    it 'renders show templates' do
      get :show, id: city.id
      expect(response).to render_template(:show)
    end
  end

  describe 'PUT update' do
    let!(:city) { FactoryGirl.create(:city, name: 'London', short_name: 'Ld') }

    context 'when valid' do
      it 'updates city parameters' do
        put :update, id: city.id, city: { name: 'London', short_name: 'Lon' }
        expect(city.reload.short_name).to eq('Lon')
      end

      it 'renders success message' do
        put :update, id: city.id, city: { name: 'London', short_name: 'Lon' }
        expect(controller.flash[:notice]).to eq('City was successfully updated.')
      end
    end
  end
end