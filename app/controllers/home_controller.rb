class HomeController < ApplicationController
  require 'watir'
  require 'webdrivers'
  require 'nokogiri'

  def index
    browser = Watir::Browser.new
    browser.goto 'https://blog.eatthismuch.com/latest-articles/'
    parsed_page = Nokogiri::HTML(browser.html)

    File.open("parsed.txt", "w") { |f| f.write "#{parsed_page}" }

    @article_cards = parsed_page.xpath("//h3[contains(@class, 'entry-title')]")

    browser.close
  end
end
