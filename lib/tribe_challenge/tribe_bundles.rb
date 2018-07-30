##
# TribeBundles, the class that acts as a directory of all the media bundles
##
class TribeBundles

  # Main directory file, this is to be edited on updates to the stock.
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
    ## 
    # Static method that gets all codes from the directory.
    #
    # @return [Array], all the codes from the bundles directory.
    ##
    def codes
      BUNDLES.keys
    end

    ## 
    # Get bundles for a specific code.
    #
    # @param [Symbol] code, the code for the bundles we are interested in.
    #
    # @return [Array], all the bundles found for specific code.
    ##
    def bundles(code)
      return false if code.nil?

      BUNDLES.fetch code
    end

    ##
    # Get all counts for a specific bundle.
    #
    # @param [Symbol] code, the code for the bundles we are interested in.
    #
    # @return [Array], all the counts found for specific code.
    ##
    def bundle_counts(code)
      response = bundles(code)
      return false if response == false

      return response.map { |h| h[:count] }
    end

    ##
    # Get price for a specific code, and bundle count.
    #
    # @param [Symbol] code, the code for the bundles we are interested in.
    # @param [Symbol] count, the count for the bundles we are interested in.
    #
    # @return [Integer], price found for specific code-count.
    ##
    def price(code, count)
      response = bundles(code)
      return false if response == false

      bundle = response.find{|h| h[:count] == count}
      bundle[:price]
    end
  end
end
