# ClientSideValidations Initializer

# Uncomment to disable uniqueness validator, possible security issue
ClientSideValidations::Config.disabled_validators = []

# Uncomment to validate number format with current I18n locale
# ClientSideValidations::Config.number_format_with_locale = true

# Uncomment the following block if you want each input field to have the validation messages attached.
#
# Note: client_side_validation requires the error to be encapsulated within
# <label for="#{instance.send(:tag_id)}" class="message"></label>
#
ActionView::Base.field_error_proc = Proc.new do |html_tag, instance|
  if html_tag.include?('type="hidden"')
    html_tag.html_safe
  else
    unless html_tag =~ /^<label/
      if html_tag.include?('error="down"')
        %{<div class="field_with_errors">#{html_tag}<label for="#{instance.send(:tag_id)}" class="error message">#{instance.error_message.first}</label></div>}.html_safe
      else
        %{<div class="field_with_errors"><label for="#{instance.send(:tag_id)}" class="error message">#{instance.error_message.first}</label>#{html_tag}</div>}.html_safe
      end
    else
      %{<div class="field_with_errors">#{html_tag}</div>}.html_safe
    end
  end
end

