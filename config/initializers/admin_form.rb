# Use this setup block to configure all options available in SimpleForm.
SimpleForm.setup do |config|
  config.wrappers :admin_content, :error_class => 'error' do |b|
    b.use :html5
    b.use :placeholder
    b.use :readonly
    b.use :label, :wrap_with => {:tag => 'div', :class => 'grid3'}
    b.use :input, :wrap_with => {:tag => 'div', :class => 'grid9'}
    b.use :error, :wrap_with => {:tag => 'span', :class => 'help-inline'}
    b.use :hint, :wrap_with => {:tag => 'p', :class => 'help-block'}
  end

end