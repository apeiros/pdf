# encoding: utf-8



require 'pdfrenderer/prince'
require 'pdfrenderer/wkhtml'
require 'pdfrenderer/version'



module PdfRenderer
  class <<self
    attr_accessor :mode
    attr_accessor :prince_path
    attr_accessor :wkhtml_path
  end

  def self.find_executable(name)
    path = `which #{name}`.chomp # cross-platform compatibility? maybe iterate over ENV["PATH"] and check File.executable?

    path.empty? ? nil : path
  end

  @prince_path  = find_executable('prince')
  @wkhtml_path  = find_executable('wkhtmltopdf')
  @mode         = @prince_path ? :prince : :wkhtml

  def self.new(*args, &block)
    case @mode
      when :prince then PdfRenderer::Prince.new(*args, &block)
      when :wkhtml then PdfRenderer::WkHtml.new(*args, &block)
      else raise "Invalid mode: #{@mode.inspect}"
    end
  end
end
