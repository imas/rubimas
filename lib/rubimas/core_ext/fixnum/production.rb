class Fixnum
  def production
    self == 765 ? Rubimas : super
  end
  alias :pro :production
end
