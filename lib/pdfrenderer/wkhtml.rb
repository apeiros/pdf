# encoding: utf-8



require 'pdfrenderer/abstract'



module PdfRenderer
  class WkHtml < Abstract
    def to_pdf_string
      executable = PdfRenderer.wkhtml_path
      options    = %w[--quiet - -]
      output     = IO.popen([executable, *options], "w+:binary") do |pdf|
        pdf.puts(string)
        pdf.close_write
        pdf.gets(nil)
      end

      output
    end

    def to_pdf_file(output_file)
      raise "Not yet implemented"
    end
  end
end
