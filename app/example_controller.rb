class ExampleController < JSMessagesViewController

  def initWithNibName(name, bundle: bundle)
    super
    self.title = 'Conversation'
    self.backgroundColor = UIColor.whiteColor
    self
  end

  def viewWillAppear(animated)
    super true
  end

  def viewWillDisappear(animated)
    super true
  end

  def viewDidLoad
    self.delegate = self
    self.dataSource = self
    super

    JSBubbleView.appearance.setFont UIFont.systemFontOfSize(16)

    messageInputView.textView.placeHolder = 'enter  message here'
    aButton = UIBarButtonItem.alloc.initWithTitle(
        'Button',
        style: UIBarButtonItemStyleBordered,
        target: self,
        action: 'aButton'
    )

    navigationItem.setRightBarButtonItem aButton
  end
  def inputViewStyle
    JSMessageInputViewStyleFlat
  end

  def tableView(tableView, numberOfRowsInSection: section)
    5
  end

  def didSendText(text)
    #TODO
  end

  def messageTypeForRowAtIndexPath(indexPath)
    if indexPath.row % 2 == 0
      JSBubbleMessageTypeIncoming
    else
      JSBubbleMessageTypeOutgoing
    end
  end

  def bubbleImageViewWithType(type, forRowAtIndexPath: indexPath)
    if indexPath.row % 2 == 0
      JSBubbleImageViewFactory.bubbleImageViewForType type, color: UIColor.js_bubbleLightGrayColor
    else
      JSBubbleImageViewFactory.bubbleImageViewForType type, color: UIColor.js_bubbleBlueColor
    end
  end

  def timestampPolicy
    JSMessagesViewTimestampPolicyEveryThree
  end

  def avatarPolicy
    JSMessagesViewAvatarPolicyAll
  end

  def subtitlePolicy
    JSMessagesViewSubtitlePolicyAll
  end

  def shouldPreventScrollToBottomWhileUserScrolling
    false
  end

  def textForRowAtIndexPath(indexPath)
    'Hello'
  end

  def timestampForRowAtIndexPath(indexPath)
    Time.now
  end

  def avatarImageViewForRowAtIndexPath(indexPath)
    UIImageView.alloc.initWithImage 'demo-avatar-cook'.uiimage
  end

  def subtitleForRowAtIndexPath(indexPath)
    'Me'
  end

  def aButton
    #navigationController.pushViewController FormController.alloc.init, animated: true
    navigationController.pushViewController FieldController.alloc.initWithNibName(nil, bundle: nil), animated: true
  end
end