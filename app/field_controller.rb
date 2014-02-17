class FieldController < UIViewController
  def initWithNibName(name, bundle: bundle)
    super
    self.title = 'FieldC'
    self
  end

  def viewWillAppear(animated)
    super true
  end

  def viewWillDisappear(animated)
    super true
  end

  def viewDidLoad
    super
    self.view.backgroundColor = UIColor.whiteColor
    @reply = UITextField.alloc.initWithFrame [[0, 100], [view.frame.size.width, 150]]
    @reply.borderStyle = UITextBorderStyleRoundedRect
    @reply.adjustsFontSizeToFitWidth = true
    @reply.delegate = self

    view << @reply
  end
end