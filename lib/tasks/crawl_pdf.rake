desc "crawl pdf"
task :crawl_pdf => :environment do
  PdfCrawlWorker.new.perform
end
