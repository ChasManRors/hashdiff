# frozen_string_literal: true

# Auto generated Code from Dash rspec.init v 0.0.12 written by Charles M Magid - generated at 1:10 PM on Jun 25, 2021
class Hashdiff
  def initialize; end

  def hashdiff(a, b)
    keys = a.keys
    keys.each_with_object({}) do |key, result|
      if (a[key] != b[key]) && !a[key].is_a?(Hash)
        result[key] = [a[key], b[key]]
      elsif a[key].is_a? Hash
        result[key] = hashdiff(a[key], b[key])
      end
    end
  end
end
