Gem::Specification.new do |s|
  s.name              = %q{refinerycms-page-videojs}
  s.version           = %q{2.0.1}
  s.description       = %q{Page Videojs Engine for Refinery CMS}
  s.date              = Date.today.strftime("%Y-%m-%d")
  s.summary           = %q{Page Videojs Engine for Refinery CMS}
  s.email             = %q{bbtfrr@gmail.com}
  s.homepage          = %q{http://github.com/resolve/refinerycms-page-videojs}
  s.authors           = ['LiYang']
  s.require_paths     = %w(lib)

  s.files             = `git ls-files`.split("\n")
  s.test_files        = `git ls-files -- spec/*`.split("\n")

  s.add_dependency    'refinerycms-pages', '~> 2.0.0'
  s.add_dependency    'refinerycms-videojs', '~> 0.5.5.1'
  s.add_development_dependency 'refinerycms-testing', '~> 2.0.0'
end
