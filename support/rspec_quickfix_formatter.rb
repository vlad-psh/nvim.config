# frozen_string_literal: true

class RSpec::Core::Notifications::ExamplesNotification
  # @return [String] The list of failed examples, fully formatted in the way
  #   that RSpec's built-in formatters emit.
  # @see https://github.com/rspec/rspec-core/blob/main/lib/rspec/core/notifications.rb#L110
  def fully_formatted_failed_examples(colorizer=::RSpec::Core::Formatters::ConsoleCodes)
    formatted = "\nFailures:\n"

    failure_notifications.each_with_index do |failure, index|
      formatted += failure.fully_formatted(index.next, colorizer)

      breadcrumbs = failure.example
                           .example_group
                           .parent_groups
                           .reverse
                           .map(&:description)
                           .append(failure.example.description)
                           .join(' → ')

      formatted += "[EE] #{failure.example.location}:#{breadcrumbs}\n"
    end

    formatted
  end
end
