#require 'simple_form'

#module WrappedButton
#  def wrapped_button(*args, &block)
#    template.content_tag :div, class: "form-actions" do
#      options = args.extract_options!
#      loading = self.object.new_record? ? I18n.t('simple_form.creating') : I18n.t('simple_form.updating')
#      options[:"data-loading-text"] = [loading, options[:"data-loading-text"]].compact
#      options[:class] = ['btn-primary', options[:class]].compact
#      args << options
#      if cancel = options.delete(:cancel)
#        submit(*args, &block) + ' ' + template.link_to(I18n.t('simple_form.buttons.cancel'), cancel, class: 'btn')
#      else
#        submit(*args, &block)
#      end
#    end
#  end
#end
#SimpleForm::FormBuilder.send :include, WrappedButton
#
#::SimpleForm::Inputs::CollectionRadioButtonsInput.class_exec do
#  def item_wrapper_class
#    "radio #{options.delete(:item_wrapper_class) || 'inline'}"
#  end
#end
#
#::SimpleForm::Inputs::CollectionCheckBoxesInput.class_exec do
#  def item_wrapper_class
#    "radio #{options.delete(:item_wrapper_class) || 'inline'}"
#  end
#end
