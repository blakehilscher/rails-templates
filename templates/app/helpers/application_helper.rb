module ApplicationHelper
  
  def photograph_tag(&block)
    return unless block_given?
    haml_tag :div, :class => "photograph" do
      haml_tag :div, :class => "inner-photograph" do
        block.call
      end
    end
  end
  
end
