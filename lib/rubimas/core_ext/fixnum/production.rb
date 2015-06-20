class Fixnum
  def production
    self == 765 ? Pro765 : super
  end
  alias :pro :production
end
