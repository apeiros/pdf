# encoding: utf-8



require 'pdfrenderer'
begin
  require 'panorama'
rescue LoadError
end



ActionController::Base.class_eval do
  def self.pdf_template_paths
    @pdf_template_paths ||= begin
      directories = []
      directories << "app/pdfs/#{controller_path}"
      directories << File.dirname(directories.last) until directories.last == "app/pdfs"
      directories << "app/views/#{controller_path}"
      directories << File.dirname(directories.last) until directories.last == "app/views"

      directories
    end
  end

  private

  def send_pdf_view(name, locals={}, send_data_options={})
    send_data_options[:type] ||= "application/pdf"
    render_options  = {layout: false, locals: locals}
    pdf             = PdfRenderer.new(render_to_string(name, render_options))

    send_data(pdf.to_pdf_string, send_data_options)
  end

  def pdf_template_paths
    self.class.pdf_template_paths
  end

  if defined? Panorama then
    def send_pdf_document(name, locals={}, send_data_options={})
      suffixes    = %w[pdf.haml haml html.haml]

      path  = Panorama.find_template(name, pdf_template_paths, suffixes)
      html  = Panorama.render_view(path, locals)
      pdf   = PdfRenderer.new(html)

      send_data_options[:type] ||= "application/pdf"

      send_data(pdf.to_pdf_string, send_data_options)
    end
  else
    def send_pdf_document(*args)
      raise "Panorama is not installed, please add `gem 'panorama'` to your Gemfile"
    end
  end
end