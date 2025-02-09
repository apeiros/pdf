# encoding: utf-8

Gem::Specification.new do |s|
  s.name                      = "pdfrenderer"
  s.version                   = "0.0.1"
  s.required_rubygems_version = Gem::Requirement.new("> 1.3.1")
  s.authors                   = "AWD Schweiz"
  s.description               = <<-DESCRIPTION.gsub(/^    /, '').chomp
    Render PDFs using prince or wkhtml.
  DESCRIPTION
  s.summary                   = <<-SUMMARY.gsub(/^    /, '').chomp
    Render PDFs using prince or wkhtml.
  SUMMARY
  s.email                     = "sdd@awd.ch"
  s.executables.concat(Dir.chdir('bin') { Dir.glob('**/*') }) if File.directory?('bin')
  s.files                     =
    Dir['bin/**/*'] +
    Dir['lib/**/*'] +
    Dir['rake/**/*'] +
    Dir['test/**/*'] +
    %w[
      pdf.gemspec
      Rakefile
      README.markdown
    ]
  s.rubygems_version          = "1.3.1"
  s.specification_version     = 3
end
