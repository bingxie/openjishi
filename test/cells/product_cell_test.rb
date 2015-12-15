require 'test_helper'

class ProductCellTest < Cell::TestCase
  test "show" do
    html = cell("product", products(:one).decorate).(:breadcrumbs)

    assert html.has_content?("尼康")
  end
end
