# frozen_string_literal: true

# create your sample spec in the root/spec dir
require 'spec_helper'
require_relative '../hashdiff'

describe 'hashdiff' do
  let(:a) { { name: 'Jill', role: 'Sales', location: { state: 'Massachusetts', city: 'Boston' } } }
  let(:b) { { name: 'Jack', role: 'Sales', location: { state: 'Massachusetts', city: 'Somerville' } } }
  let(:answer) { { name: %w[Jill Jack], location: { city: %w[Boston Somerville] } } }
  let(:f) { Hashdiff.new }

  context 'When given two similar hashes' do
    it "has a top level hash with key :name and value ['Jill', 'Jack']" do
      expect(f.hashdiff(a, b)[:name]).to eq(%w[Jill Jack])
    end

    it 'returns expected hashdiff sequence' do
      expect(f.hashdiff(a, b)).to eq answer
    end
  end
end
