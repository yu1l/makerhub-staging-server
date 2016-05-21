require 'rails_helper'

RSpec.describe 'RootPath', type: :feature, js: true do
  context 'title' do
    before { visit root_path }
    subject { page.title }
    it { is_expected.to eq(I18n.t('title'))}
  end
end
