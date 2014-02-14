class FormController <  Formotion::FormController
  def init
    @form = Formotion::Form.new({
                title: 'Some field',
                sections: [{
                   rows: [{
                      title: 'User Name',
                      type: :text,
                       key: :username
                  }]
                }]
              })

    super.initWithForm @form
  end

  def viewDidLoad
    super
  end
end