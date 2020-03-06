class RequestNotifier
  # AWS sets a max of 50 recipients
  MAX_EMAIL_RECIPIENTS = 25

  def self.email(event, short_url_request, mailer: Notifier)
    recipients_for(event, short_url_request)
      .in_groups_of(MAX_EMAIL_RECIPIENTS, false)
      .map do |recipient_group|
        mailer.send(event, short_url_request, recipient_group)
      end
  end

  def self.recipients_for(event_category, short_url_request)
    if event_category == :short_url_requested
      User.notification_recipients.map(&:email)
    else
      Array(short_url_request.contact_email)
    end
  end
end
