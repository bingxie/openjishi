require 'test_helper'

class ProductCellTest < Cell::TestCase
  test "show" do
    html = cell("product", products(:one).decorate).call(:breadcrumbs)

    assert html.has_content?("尼康")
  end
end
