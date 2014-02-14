module JSMessagesHelper

  def inputViewStyle
    JSMessageInputViewStyleFlat
  end

  def tableView(tableView, numberOfRowsInSection: section)
    5
  end

  def didSendText(text)
    #TODO
    @data[:message] = text
    BW::HTTP.post $HOST + 'v1/conversation', {payload: @data} do |response|
      if response.ok?
        self.finishSend
        reload { scrollToBottomAnimated(true) }
      else
        App.alert "Cannot send the message"
      end
    end
  end

  def messageTypeForRowAtIndexPath(indexPath)
    #if @messages[indexPath.row].name.text != MyUser.uname
    #  JSBubbleMessageTypeIncoming
    #else
      JSBubbleMessageTypeOutgoing
    #end
  end

  def bubbleImageViewWithType(type, forRowAtIndexPath: indexPath)
    #if @messages[indexPath.row].name.text != MyUser.uname
    #  JSBubbleImageViewFactory.bubbleImageViewForType type, color: UIColor.js_bubbleLightGrayColor
    #else
      JSBubbleImageViewFactory.bubbleImageViewForType type, color: UIColor.js_bubbleBlueColor
    #end
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
    'lol'
    #@messages[indexPath.row].message.text
  end

  def timestampForRowAtIndexPath(indexPath)
    Time.now
    #@messages[indexPath.row].ttime
  end

  def avatarImageViewForRowAtIndexPath(indexPath)
    UIImageView.alloc.initWithImage 'demo-avatar-cook'.uiimage
  end

  def subtitleForRowAtIndexPath(indexPath)
    'lol'
    #@messages[indexPath.row].name.text
  end

  def sortData
    @messages.sort! { |x, y| x.created_at <=> y.created_at }.uniq!
  end

  def reload(&block)
    # @messages = []
    @data[:page] = 0
    loadData do |oldmessages|
      self.tableView.reloadData
      self.scrollToBottomAnimated true
      markRead
    end
  end
end