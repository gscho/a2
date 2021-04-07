require "test_helper"

class A2ClientTest < Minitest::Test
  def test_that_it_can_be_initialized
    refute_nil ::A2::Client.new(automate_url: 'https://example.com', automate_token: 'foo')
    refute_nil ::A2::Client.new(automate_url: 'https://example.com', automate_token: 'foo', ssl_no_verify: true)
  end

  def test_that_it_raises_error_on_nil_url
    ENV['AUTOMATE_URL'] = nil
    assert_raises A2::Error do
      ::A2::Client.new(automate_token: 'foo')
    end
  end

  def test_that_it_raises_error_on_nil_token
    ENV['AUTOMATE_TOKEN'] = nil
    assert_raises A2::Error do
      ::A2::Client.new(automate_url: 'https://example.com')
    end
  end
end
