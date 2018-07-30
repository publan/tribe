##
# Main class for the Tribe bundler. The purpose of this class is to handle
# parsing input, do the bundling and handle formatting for the output.
##
class TribeBundler

  ##
  # Parse basic input that comes in the form of a line of requests.
  # @example
  # parse('10 IMG 15 FLAC 13 VID')
  #
  # @param [String] line, The line to parse.
  #
  # @return [Hash], the bundles of media items that correspond to the given
  # line.
  ##
  def parse(line)
    return false if line.nil?

    line.downcase!
    # pick up the different totals and codes from the input for processing
    valid_codes = TribeBundles.codes
    regex_source = /([\d]*) (#{valid_codes.join('|')})/
    entries = line.scan(Regexp.new(regex_source))
    result = []
    entries.each { |entry| result << bundle(entry.first, entry.last.to_sym) }
    return result
  end

  ##
  # Do the logic for finding the right bundles for a given count.
  #
  # @example bundle(10, :img)
  #
  # @param [Integer] count, the total count of items
  # @param [Symbol] code, the symbol representing the bundle required.
  # 
  # @return [Hash], the bundles that could be found (and any leftovers) to be
  # combined for the given count and code
  ##
  def bundle(count, code)
    count = count.to_i

    # we want the bundle counts in descending order, this is important for the
    # behaviour of this method so be careful
    counts = TribeBundles.bundle_counts(code).sort.reverse

    result = { code: code, count: count, bundles: {} }
    counts.each do |value|
      modulus = count % value
      next unless modulus == 0 || counts.include?(modulus)

      num = count / value
      count = count - (value * num)
      result[:bundles][value] = num
    end

    result[:leftover] = count

    return result
  end

  ## 
  # Helper method for getting quick overview of what the `parser` method returns
  # @example
  # TribeBundler.format(bundler.parse(10, 'img'))
  #
  # @param [Array] parser_result, Array of hashes that the `parser` method returns
  #
  # @response [nil], example:
  # <<-HDOC
  # 10 IMG $800
  #   1 x 10 $800
  # 15 FLAC $1957.50
  #   1 x 9 $1147.50
  #   1 x 6 $810
  # 13 VID $2370
  #   2 x 5 $1800
  #   1 x 3 $570
  # HDOC
  ##
  def self.format(parser_result)
    parser_result.each do |code|
      code_price = code[:bundles]
        .reject{ |k, v| v == 0 }
        .inject(0) { |sum, count| sum + TribeBundles.price(code[:code], count.first) * count.last }

      puts "#{code[:count]} #{code[:code].to_s.upcase} #{code_price}"
      code[:bundles].reject{ |k,v| v == 0 }.each{ |bundle| puts "\t#{bundle.first} x #{bundle.last}" }
    end
  end
end
