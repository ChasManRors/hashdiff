# frozen_string_literal: true

# create your sample spec in the root/spec dir
require 'spec_helper'
require_relative '../hashdiff'

describe 'hashdiff' do
  let(:a) { { name: 'Jill', role: 'Sales', location: { state: 'Massachusetts', city: 'Boston' } } }
  let(:b) { { name: 'Jack', role: 'Sales', location: { state: 'Massachusetts', city: 'Somerville' } } }
  let(:answer) { { name: %w[Jill Jack], location: { city: %w[Boston Somerville] } } }
  let(:f) { Hashdiff.new }

  context 'Stard - Given When Then' do
    it "has a top level hash with key :name and value ['Jill', 'Jack']" do
      expect(%w[Jill Jack]).to eq(f.hashdiff(a, b)[:name])
    end

    it 'returns expected hashdiff sequence' do
      expect(answer).to eq f.hashdiff(a, b)
    end
  end
end
