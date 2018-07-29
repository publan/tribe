# Given formats:
# Submission format Format code Bundles
# Image IMG 5 @ $450
#          10 @ $800
# Audio Flac 3 @ $427.50
#            6 @ $810
#            9 @ $1147.50
# Video VID 3 @ $570
#           5 @ $900
#           9 @ $1530

class TribeBundles
  BUNDLES = {
    img: [
      { count: 5, price: 450 },
      { count: 10, price: 800 }
    ],
    flac: [
      { count: 3, price: 427.50 },
      { count: 6, price: 810 },
      { count: 9, price: 1147.50 }
    ],
    vid: [
      { count: 3, price: 570 },
      { count: 5, price: 900 },
      { count: 9, price: 1530 }
    ]
  }
  
  class << self
    def codes
      BUNDLES.keys
    end

    def bundles(code)
      return false if code.nil?

      BUNDLES.fetch code.to_sym
    end

    def bundle_counts(code)
      response = bundles(code)
      return false if response == false

      return response.map { |h| h[:count] }
    end
  end
end
