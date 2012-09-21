class SecondViewController < UIViewController

  def init
    super.tap do
      self.title = "Second"
    end
  end

  layout :root do
    subview(UITableView.grouped, delegate: self, dataSource: self)
  end

  def viewDidLoad
    super
    @data = %w{Lorem ipsum dolor sit amet consectetur adipiscing elit}
    @selected = []
  end

  ##|
  ##|  UITableView DELEGATE/DATASOURCE
  ##|
  def numberOfSectionsInTableView(table_view)
    1
  end

  def tableView(table_view, titleForHeaderInSection:section)
    "Lorem Ipsum"
  end

  def tableView(table_view, numberOfRowsInSection:section)
    case section
    when 0
      @data.size
    end
  end

  def tableView(table_view, cellForRowAtIndexPath:index_path)
    case index_path
    when IndexPath[0]
      cell_identifier = 'SecondViewController - lorem cell'
      cell = table_view.dequeueReusableCellWithIdentifier(cell_identifier)

      if not cell
        cell = UITableViewCell.alloc.initWithStyle(:default.uitablecellstyle,
                            reuseIdentifier: cell_identifier)
      end

      row = @data[index_path.row]
      if @selected.include? row
        cell.accessoryType = :checkmark.uitablecellaccessory
      else
        cell.accessoryType = :none.uitablecellaccessory
      end
      cell.textLabel.text = row
    end

    return cell
  end

  def tableView(table_view, didSelectRowAtIndexPath:index_path)
    table_view.deselectRowAtIndexPath(index_path, animated:true)

    row = @data[index_path.row]
    if @selected.include? row
      @selected.delete(row)
    else
      @selected << row
    end
    table_view.reloadData
  end
end
