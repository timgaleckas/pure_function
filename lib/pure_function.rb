class PureFunction
  @@cache = {}
  def self.cache(&block)
    calling_line = caller.first
    calling_line = calling_line[0..(calling_line.index(':in')||0)-1]
    return Marshal.load(@@cache[calling_line]) if @@cache[calling_line]
    ret_val = yield
    @@cache[calling_line]=Marshal.dump(ret_val)
    return ret_val
  end
  def self.clear
    @@cache = {}
  end
end
