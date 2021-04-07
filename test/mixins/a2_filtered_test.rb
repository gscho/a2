require "test_helper"

class A2FilteredTest < Minitest::Test
  def test_that_it_sets_custom_opts
    filtered = ::A2::Filtered.new('test', query_filter: true, filter_key: 'custom_key')
    assert filtered.query_filter
    assert_equal 'custom_key', filtered.filter_key
  end

  def test_that_it_parses_filters
    filtered = ::A2::Filtered.new('test')
    filter_string = 'node_id:test-node-uuid,start_time:2021-03-24T00:01:00Z,end_time:2021-03-25T15:37:25Z,status:failed'
    parsed = filtered.parse_filters(filter_string)
    expected = [
      {
      'key' => 'node_id',
      'values' => ['test-node-uuid']
      },
      {
      'key' => 'start_time',
      'values' => ['2021-03-24T00:01:00Z']
      },
      {
      'key' => 'end_time',
      'values' => ['2021-03-25T15:37:25Z']
      },
      {
      'key' => 'status',
      'values' => ['failed']
      }
    ]
    assert_equal expected, parsed
  end

  def test_that_it_parses_filters_with_custom_filter_key
    filtered = ::A2::Filtered.new('test', filter_key: 'my-key')
    filter_string = 'node_id:test-node-uuid,start_time:2021-03-24T00:01:00Z,end_time:2021-03-25T15:37:25Z,status:failed'
    parsed = filtered.parse_filters(filter_string)
    expected = [
      {
      'my-key' => 'node_id',
      'values' => ['test-node-uuid']
      },
      {
      'my-key' => 'start_time',
      'values' => ['2021-03-24T00:01:00Z']
      },
      {
      'my-key' => 'end_time',
      'values' => ['2021-03-25T15:37:25Z']
      },
      {
      'my-key' => 'status',
      'values' => ['failed']
      }
    ]
    assert_equal expected, parsed
  end
end
