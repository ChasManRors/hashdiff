# frozen_string_literal: true

require 'pry'
# Auto generated Code from Dash rspec.init v 0.0.12 written by Charles M Magid - generated at 1:10 PM on Jun 25, 2021
class Hashdiff
  def initialize; end

  def hashdiff(hash_a, hash_b)
    # binding.pry
    hash_a.keys.each_with_object({}) do |key, result|
      if hash_a[key].is_a?(Hash)
        result[key] = hashdiff(hash_a[key], hash_b[key])
      elsif hash_a[key] != hash_b[key]
        result[key] = [hash_a[key], hash_b[key]]
      end
    end
  end
end
