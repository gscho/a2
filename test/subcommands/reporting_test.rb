require "test_helper"

class ReportingTest < Minitest::Test
  def test_that_it_skips_minor
    list_reports = ::A2::Subcommand::Reporting::ListReports.new
    report_json = JSON.parse(File.read(__dir__ + '/../fixtures/reports/list_reports.json'))
    reports = list_reports.filter_by_min_impact(report_json, 'minor')
    reports['reports'].each do |report|
      refute_equal 'minor-only', report['node_name']
    end
    assert_equal 3, reports['reports'].size
  end

  def test_that_it_skips_major
    list_reports = ::A2::Subcommand::Reporting::ListReports.new
    report_json = JSON.parse(File.read(__dir__ + '/../fixtures/reports/list_reports.json'))
    reports = list_reports.filter_by_min_impact(report_json, 'major')
    reports['reports'].each do |report|
      refute_equal 'minor-only', report['node_name']
    end
    assert_equal 2, reports['reports'].size
  end
end
