require "pdf/reader"

module PdfReaderExt
  # fix rate: 1.05 -> 1.5
  # c.f https://github.com/yob/pdf-reader/blob/v2.6.0/lib/pdf/reader/page_layout.rb#L72-L74
  def col_count
    @col_count ||= ((page_width / @median_glyph_width) * 1.5).floor
  end
end

PDF::Reader::PageLayout.prepend(PdfReaderExt)
