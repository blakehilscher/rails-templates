String.class_eval do
  def keyize
    self.gsub(/[_ \/-]+/, '_').downcase
  end
  def humanize
    str = self.gsub(/[-_ \/]+/, ' ')
    str[0].upcase + str[1..-1]
  end
end