# Code from http://collectiveidea.com/blog/archives/2012/01/27/testing-file-downloads-with-capybara-and-chromedriver/
# encoding: UTF-8
module DownloadHelpers
  TIMEOUT = 10
  PATH    = File.expand_path("tmp/downloads")

  extend self

  def downloads
    Dir["#{PATH}/*"]
  end

  def download
    downloads.first
  end

  def download_content
    wait_for_download
    File.read(download).force_encoding("utf-16").encode("utf-8", replace:nil )
  end

  def wait_for_download
    Timeout.timeout(TIMEOUT) do
      sleep 0.1 until downloaded?
    end
  end

  def downloaded?
    !downloading? && downloads.any?
  end

  def downloading?
    downloads.grep(/\.crdownload$/).any?
  end

  def clear_downloads
    FileUtils.rm_f(downloads)
  end
end

World(DownloadHelpers)

Before do
  clear_downloads
end

After do
  clear_downloads
end
