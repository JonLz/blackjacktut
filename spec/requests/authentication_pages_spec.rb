require 'spec_helper'

describe 'LoginPages' do
subject { page }

  describe 'the page should say sign in' do 
    before { visit login_path } 
    it { should have_selector('h1', text:'Sign in') }
  end

  describe 'user signup' do
    before { visit login_path }

    describe 'with invalid information' do
      before { click_button 'Sign in' }

      it { should have_selector('h1', text:'Sign in') }
      it { should have_selector('div.alert.alert-error', text: 'Invalid email/password combination')}
    end

    describe 'with valid information' do
      let(:user) { FactoryGirl.create(:user) }
      before do
        fill_in "Name",     with:  user.name
        fill_in "Password", with:  user.password
        click_button 'Sign in' 
      end

      it { should have_selector('h1', text:'Sign Up For BlackJack') }
      it { should_not have_selector('div.alert.alert-error') }
    end
  
  end #end describe user signup

end #end describe Loginpages