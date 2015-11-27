class Grid::CustomPrimaryKey < Netzke::Basepack::Grid
  def configure(c)
    c.title = "Books (model with custom primary key)"
    c.model = "BookWithCustomPrimaryKey"
    c.columns = [:author__name, :title]
    c.edit_inline = true
    super
  end
end
