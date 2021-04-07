require "test_helper"

class A2ApprovedTest < Minitest::Test
  include A2::Approved

  def test_that_it_asks_for_approval
    answer = stub_stdin_puts('yes') do
      ask_for_approval 'test approvals'
    end
    assert_equal 'yes', answer
  end

  def test_that_it_asks_for_approval_and_exits_if_no
    assert_raises SystemExit do
      stub_stdin_puts('no') do
        ask_for_approval 'test no'
      end
    end
    assert_raises SystemExit do
      stub_stdin_puts('foo bar') do
        ask_for_approval 'test foo bar'
      end
    end
  end

  def test_that_it_calls_block_with_approval
    stub_stdin_puts('yes') do
      approved = with_approval(message: 'test with approval') do
        'madeit'
      end
      assert_equal 'madeit', approved
    end
  end

  def test_that_it_does_not_call_block_without_approval
    assert_raises SystemExit do
      stub_stdin_puts('no') do
        with_approval(message: 'test without approval') do
          'madeit'
        end
      end
    end
  end
end
