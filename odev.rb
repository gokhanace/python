
#{Encoding:UTF-8}
class Stack
	  def initialize
	    @dizin = Array.new
	  end
	
	  
	  def push(elemanlar)
	    @dizin.push(elemanlar)
	    self
	  end  

	  def pop
	    return(@dizin.pop())
	  end

	  
	  def isEmpty?
	    return @dizin== Array.new
	  end

	  def size
	    return (@dizin.length())
	  end

               end
 
 
 
 
# dosya_icerikteki karakterlerin filitrelenmesi.
def html_filtrele()
	html_icerik = File.open("dosyanızın_adını_girin.*","r") do |dosya_icerik|
		satirlar = dosya_icerik.readlines
	end
 
 
	html_icerik = html_icerik.join().to_s
 
 
	duzenli_ifade = /(<.+?>)/ 
	uyumlar = html_icerik.scan(duzenli_ifade)
 
	filter = []
 
	uyumlar.each do |filt|
		filter.push(filt)
	end
	
	puts("Html dosya_icerik içerisindeki simgelerin süzülmüş şekli")
	
	filter = filter.join(" ").split(" ")
	
	dizi = []
	filter.each do |eleman|
	    if eleman.match(/<[^\/]+?>/) then
	       dizi.push(eleman)
	     end
	end
	
	print filter
	puts()
	
	puts("HTML dosyamizda ki acik simgeler:")
	
	print dizi
	puts() 
 
	print("Simgeler dengelimi  ?---> Sonuc:")
	puts(html_denge(filter))
 
	
end
 
# dosya_icerik teki simgelerin dengeli  veya dengesiz olup olmamasını  kontrol ediyoruz .
def html_denge(simgeler)
		index = 0
		a = Stack.new()
		balanced = true
		
		dizi = []
		simgeler.each do |eleman|
		    if eleman.match(/<[^\/]+?>/) then
		       dizi.push(eleman)
		     end
		end
	
		while (index < simgeler.length() and balanced == true) do
			simge = simgeler[index]
			
			
			if dizi.include?(simge) then
				a.push(simge)
			else
				if a.isEmpty? then
					balanced = false
				else
					ilk = a.pop()
					if not matches(ilk,simge) then
						balanced = false
					end	
				end
			end
			index = index + 1
		end
			
		if balanced and a.isEmpty? then
			return true
 
		else
			return false
 
		end
end
 
def matches(openSimge,closeSimge)
	open =["<html>","<head>","<title>","<body>","<center>","<ul>","<ol>","<br>","<hx>","<b>","<hr>","<p>","<pre">,"<dl>","<dt>"]
	close =["</html>","</head>","</title>","</body>","</center>","</ul>","</ol>","</br>","</hx>","</b>","</hr>","</p>","</pre>","</dl>","</dt>",]
	
	return open.index(openSimge) == close.index(closeSimge)
end
	
def main
 	html_filtrele
end
 
main if __FILE__ == $PROGRAM_NAME
