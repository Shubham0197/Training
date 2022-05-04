module A
    def a1
        puts "in a1"
    end
    def a2
        puts "in a2"
    end
 end
 module B
    def b1
        puts "in b1"
    end
    def b2
        puts "in b2"
    end
 end
 
 class Sample
 include A
 include B
    def s1
        puts "in s1"
    end
 end
 
 samp = Sample.new
 samp.a1
 samp.a2
 samp.b1
 samp.b2
 samp.s1

=begin
 itsacheckmate@itsacheckmate:~/Training/Ruby$ ruby mixin_practice.rb 
in a1
in a2
in b1
in b2
in s1
=end