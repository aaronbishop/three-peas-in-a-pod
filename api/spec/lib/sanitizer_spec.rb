# spec/lib/sanitizer_spec.rb
require "rails_helper"

RSpec.describe "Default SafeList sanitizer" do
  let(:sanitizer) { Rails::Html::SafeListSanitizer.new }

  it "removes scripts but keeps safe tags" do
    html = '<p>Hello <strong>world</strong><script>alert(1)</script></p>'
    out  = sanitizer.sanitize(html)
    expect(out).to include("<strong>world</strong>")
    expect(out).not_to include("<script>")
  end

  it "strips dangerous attributes" do
    html = '<a href="javascript:alert(1)" onclick="x()">x</a>'
    out  = sanitizer.sanitize(html)
    expect(out).not_to include("onclick")
    expect(out).not_to include('href="javascript:')
  end
end
