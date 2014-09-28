module Pro765
  def self.method_missing(name, *args)
    if Rubimas::Idol.valid?(name)
      Rubimas::Idol.find(name)
    else
      super
    end
  end
end
