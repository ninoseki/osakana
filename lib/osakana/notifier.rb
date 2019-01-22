# frozen_string_literal: true

require "slack/incoming/webhooks"

module Osakana
  class Notifier
    def notifiy(title, attachments = [])
      if slack_webhook_url?
        slack = Slack::Incoming::Webhooks.new(slack_webhook_url, channel: slack_channel)
        slack.post title, attachments: attachments
      else
        puts title
        attachments.each do |attachment|
          puts attachment.dig(:title)
        end
      end
    end

    def slack_webhook_url
      ENV.fetch "SLACK_WEBHOOK_URL"
    end

    def slack_channel
      ENV.fetch "SLACK_CHANNEL", "#general"
    end

    def slack_webhook_url?
      ENV.key? "SLACK_WEBHOOK_URL"
    end

    def self.notify(title, text)
      new.notifiy(title, text)
    end
  end
end
