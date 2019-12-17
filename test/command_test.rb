require "test_helper"
require "command"

class CommandTest < Minitest::Test

  def subject
    JSON.parse Command.run(command: command).to_json
  end

  def command
    @command ||= "~/pco-box/bin/box check-version"
  end

  def test_to_json_provides_the_expected_data
    output = "ok"
    err = ""
    status = 0

    Open3.stub :capture3, [output, err, status] do
      actual = subject
      assert actual.dig("alfredworkflow", "arg")
      assert_equal actual.dig("alfredworkflow", "variables", "output"), output
      assert_equal actual.dig("alfredworkflow", "variables", "err"), err
      assert_equal actual.dig("alfredworkflow", "variables", "status"), status
    end
  end
end
