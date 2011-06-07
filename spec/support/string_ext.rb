class String
  def rpc
    split("\n").map(&:lstrip).join("\n") << "\n\n"
  end
end