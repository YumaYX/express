def a1(b1); b1.each_char.map { |c| c.ord.to_s(16) }.join; end
def b2(c2); c2.scan(/../).map { |x| x.to_i(16).chr }.join; end
def c3(d3); puts d3.gsub("\n", "<br>"); end

e4 = [97, 108, 97, 115, 107, 105, 97, 114, 116, 97, 101, 97]
f5 = [112, 111, 115, 101, 102, 111, 114, 97, 97, 112, 114, 111]
g6 = [99, 104, 97, 114, 97, 99, 116, 101, 114]

h7 = [e4, f5, g6].map { |x| b2(a1(x)) }.join("\n")

c3(h7)
