def find(val)
  @numero = []
  val.each_byte do |x|
    @numero << x
  end
  return @numero
end

def convert
  @numero.map! do |x|
    x - 32 if (97..122).include? x
  end
  @numero.chr.join
end

def uppercasing(string)
  find_ascii_of(string)
  convert
end

  #trying to write the uppercase method ourselves
  #each_byte = gives asci key . if you minus 32 you get upper case character