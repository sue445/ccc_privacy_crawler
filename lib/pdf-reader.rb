# rubocop:disable Style/FileName
require "pdf/reader"

class PDF::Reader::PageLayout
  # fix rate: 1.05 -> 1.5
  def col_count
    @col_count ||= ((@page_width / @mean_glyph_width) * 1.5).floor
  end
end
