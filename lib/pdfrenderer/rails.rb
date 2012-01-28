# encoding: utf-8



require 'pdfrenderer'



ActionController::Base.class_eval do
  def send_pdf_view(*args)
    #context = view_context
    send_data_options = args.last.is_a?(Hash) ? args.pop.dup : {}
    options           = send_data_options.slice!(:filename, :type, :disposition, :status)
    options[:layout]  = false unless options.has_key?(:layout)
    send_data_options[:type] ||= "application/pdf"
    args.push(options)

    pdf     = PdfRenderer.new(render_to_string(*args))

    send_data(pdf.to_pdf_string, send_data_options)
  end
end