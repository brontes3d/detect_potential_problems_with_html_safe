ActiveSupport::SafeBuffer.class_eval do
  
  def concat(value)
    if value.html_safe?
      super(value)
    else
      if value.blank?
        super(ERB::Util.h(value))
      else
        puts "WARNING: Attempted to concat normal string onto ActiveSupport::SafeBuffer"
        puts "left: \n" + self.to_s
        puts "right: \n" + value.to_s
        raise "WARNING: Attempted to concat normal string onto ActiveSupport::SafeBuffer"
      end
    end
  end
  
end