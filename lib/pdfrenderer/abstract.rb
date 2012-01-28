# encoding: utf-8

module PdfRenderer
  class Abstract
    attr_reader :string

    def initialize(string)
      @string = string
    end

    def to_pdf_string
      raise "Not implemented, must be implemented by subclass"
    end
  end
end
