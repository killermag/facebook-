module UsersHelper
  
  def formatted_name 
    return (self.first).capitalize + ' ' + (self.last).capitalize
  end 

  

  module ClassMethods 
    def genders 
      ['M','F','Custom']
    end 
  
    def from_omni_auth(auth)
    end 
    
    
  
    def default_profile_pic 
      "https://scontent-ort2-2.xx.fbcdn.net/v/t1.30497-1/c35.0.120.120a/p120x120/84241059_189132118950875_4138507100605120512_n.jpg?_nc_cat=1&ccb=2&_nc_sid=7206a8&_nc_ohc=p9OnxhNOvn4AX97lUx6&_nc_ht=scontent-ort2-2.xx&tp=27&oh=f09856717e5c2613710bf4e6d0b90b78&oe=603D3765"
    end 

  end 

  def self.included(subclass)
    subclass.extend(ClassMethods) 
  end 

end 