# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Test', type: :request do
  describe 'GET /test' do
    subject(:result) { get test_path }

    it 'アクセスできること' do
      expect(result).to eq 200
    end
  end
end
