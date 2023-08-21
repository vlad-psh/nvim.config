# frozen_string_literal: true

class RSpec::Core::Formatters::ExceptionPresenter
  # @see https://github.com/rspec/rspec-core/blob/master/lib/rspec/core/formatters/exception_presenter.rb#L84-L95
  def fully_formatted_lines(failure_number, _colorizer)
    breadcrumbs = example.example_group
                         .parent_groups
                         .reverse
                         .map(&:description)
                         .append(example.description)
                         .join(' ◆ ')

    lines = [
      breadcrumbs,
      "[EE] #{example.location}:#{example.exception}",
      read_failed_lines,
      '',
      formatted_backtrace,
      ''
    ].flatten.compact

    indent_lines(lines, failure_number)
  end
end
