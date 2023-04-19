class Nameable
  def correct_name
    NotImplementedError "#{self.class} has not implemented method '#{__method__}'"
  end
end
