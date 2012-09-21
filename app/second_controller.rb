class SecondViewController < UIViewController

  def init
    super.tap do
      self.title = "Second"
    end
  end

  layout :root do
    subview(UITableView.grouped, delegate: self, dataSource: self)
  end

  def viewWillAppear(animated)
    super
    @user = User.current
  end

  def viewWillDisappear(animated)
    super
    User.persist
  end

  ##|
  ##|  UITableView DELEGATE/DATASOURCE
  ##|
  def numberOfSectionsInTableView(table_view)
    1
  end

  def tableView(table_view, titleForHeaderInSection:section)
    "Favorite Languages"
  end

  def tableView(table_view, numberOfRowsInSection:section)
    case section
    when 0
      User::FavoriteChoices.size
    end
  end

  def tableView(table_view, cellForRowAtIndexPath:index_path)
    case index_path
    when IndexPath[0]
      cell_identifier = 'SecondViewController - favorite language'
      cell = table_view.dequeueReusableCellWithIdentifier(cell_identifier)

      if not cell
        cell = UITableViewCell.alloc.initWithStyle(:default.uitablecellstyle,
                            reuseIdentifier: cell_identifier)
      end

      lang = User::FavoriteChoices[index_path.row]
      if @user.likes? lang
        # sugarcube uses :symbol.uiconstantgroup as an alternative to
        # UIConstantGroupLongNameSymbolName.  So this style is the same as
        # using UITableViewCellAccessoryCheckmark.  you only really save a
        # few characters, but when you combine this with sweettea and teacup
        # handlers, your stylesheet code can be very short and sweet.
        cell.accessoryType = :checkmark.uitablecellaccessory
      else
        # UITableViewCellAccessoryNone
        cell.accessoryType = :none.uitablecellaccessory
      end
      cell.textLabel.text = lang
    end

    return cell
  end

  def tableView(table_view, didSelectRowAtIndexPath:index_path)
    table_view.deselectRowAtIndexPath(index_path, animated:true)

    lang = User::FavoriteChoices[index_path.row]
    if @user.likes? lang
      @user.dislikes! lang
    else
      @user.likes! lang
    end
    table_view.reloadData
  end

end
