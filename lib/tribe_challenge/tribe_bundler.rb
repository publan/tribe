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
  # @param [String] line The line to parse.
  #
  # @return [nil], the method will output the results we want to console.
  ##
  def parse(line)
    line.downcase!
    # pick up the different totals and codes from the input for processing
    valid_codes = TribeBundles.codes
    regex_source = /([\d]*) (#{valid_codes.join('|')})/
    entries = line.scan(Regexp.new(regex_source))
    result = []
    entries.each { |entry| result << bundle(entry.first, entry.last) }
    
    puts format(result)
  end

  def bundle(count, type)
    count = count.to_i
    # we want the bundle counts in descending order
    counts = TribeBundles.bundle_counts(type).sort.reverse

    result = {}
    counts.each do |value|
      modulus = count % value
      next unless modulus == 0 || counts.include?(modulus)

      num = count / value
      count = count - (value * num)
      result[value] = num
    end

    result['leftover'] = count

    return result
  end
end
