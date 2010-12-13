require 'mail'
require 'erb'
require 'exceptioner/transport/base'
require 'exceptioner/transport/helper'

module Exceptioner::Transport

  class Email < Base
    DEFAULT_SENDER_ADDRESS = 'exceptioner@exceptioner.net'

    cattr_accessor :delivery_method

    cattr_accessor :delivery_options

    def self.deliver(exception, options = {})
      mail = prepare_email(exception, options)
      mail.deliver
    end

    def self.render(exception, options = {})
      ERB.new(template, nil, '>').result(binding)
    end

    def self.template
      @template ||= File.read(File.expand_path(File.join(File.dirname(__FILE__), 'templates', 'exception.erb')))
    end
    
    def self.determine_email_options(exception, email_options)
      options = {}
      options[:from]    ||= options[:sender]
      options[:to]      ||= options[:recipients]
      options[:subject] ||= prefixed_subject(exception, options)
      options[:body]    ||= render(exception, email_options)
      options.merge!(default_options)
    end

    protected
    def self.default_options
      super.merge(
        :delivery_method => delivery_method,
        :delivery_options => delivery_options,
        :sender => DEFAULT_SENDER_ADDRESS
      )
    end

    def self.prepare_email(exception, email_options)
      options = email_options.dup
      options = default_options.merge(options)
      puts options.inspect
      options[:subject] ||= prefixed_subject(exception, options)
      options[:body] ||= render(exception, email_options)

      mail = Mail.new(
        :from             => options[:sender], 
        :to               => options[:recipients],
        :subject          => options[:subject],
        :body             => options[:body]
      )
      mail.delivery_method(options[:delivery_method], options[:delivery_options]) if options[:delivery_method]
      mail
    end

  end

end
