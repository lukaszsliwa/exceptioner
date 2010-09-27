# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{exceptioner}
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Micha\305\202 \305\201omnicki"]
  s.date = %q{2010-09-27}
  s.description = %q{The most common use is to use Exceptioner as rack middleware and send notifications when an exception occur in you web application. It may be used with Rails, Sinatra or any other rack citizen. 
      Exceptioner may be also used with any ruby code you want. Just configure delivery methods and don't miss any exception.}
  s.email = %q{michal@lomnicki.com.pl}
  s.extra_rdoc_files = [
    "LICENSE",
     "README.rdoc"
  ]
  s.files = [
    ".document",
     ".gitignore",
     "LICENSE",
     "README.rdoc",
     "Rakefile",
     "lib/exceptioner.rb",
     "lib/exceptioner/core_ext/class/attribute_accessors.rb",
     "lib/exceptioner/middleware.rb",
     "lib/exceptioner/notifier.rb",
     "lib/exceptioner/transport/base.rb",
     "lib/exceptioner/transport/email.rb",
     "lib/exceptioner/transport/templates/exception.erb",
     "spec/exceptioner_spec.rb",
     "spec/spec.opts",
     "spec/spec_helper.rb"
  ]
  s.homepage = %q{http://github.com/mlomnicki/exceptioner}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.6}
  s.summary = %q{Be notified about exceptions by various transports Email, Jabber, RSS. Choose the option you want}
  s.test_files = [
    "spec/exceptioner_spec.rb",
     "spec/spec_helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rspec>, [">= 1.2.9"])
    else
      s.add_dependency(%q<rspec>, [">= 1.2.9"])
    end
  else
    s.add_dependency(%q<rspec>, [">= 1.2.9"])
  end
end
