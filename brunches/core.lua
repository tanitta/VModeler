namespace"trit"{
	namespace"vmodeler"{
		class"BaseVModel"{
				field"strName":init("");	
				field"tabVal":init({});
				field"tabBody":init({});
				field"tabLua":init({});
				
		    	metamethod"_init"
		    	:body(function(self)
		    		self.strName = ""
		    		self.tabVal = {}
		    		self.tabBody = {
		    			{type = "CORE", direction = "N", angle = 0, color = 0, effect = 0, child = {
		    			}}
		    		}
		    		self.tabLua = {}
		    	end);
		
		    	metamethod"__call"
		    	:body(function(self)
		    	end);
		};
		
		class"VImport"{
		    	metamethod"_init"
		    	:body(function(self,strFilePath)
		    		self.strFilePath = strFilePath
		    		self.objTxtFile = trit.fileio.BaseFile:new(self.strFilePath)
		    		self.strRaw = self.objFile:GetString()
		    		
		    		self.strName = ""
		    		self.tabVal = {}
		    		self.tabBody = {}
		    		self.tabLua = {} 		    		
		    	end);
		
				method"Reload"
				:body(function(self)
		    		self.strRaw = self.objTxtFile:GetString()
					
				end);
		
		    	method"GenerateData"
		    	:body(function(self)
		    		local h,f = 0,0
		    		local strBuffer = ""
		    		
		    		-- ValBlock
		    		do
			    		h, f = string.find(self.strRaw,"Val\n{")
			    		repeat 
			    			string.find("\(")
			    		until strBuffer ~= "}"
			    	end	
			    	-- BodyBlock
			    	-- LuaBlock
		    	end);
		};
		
		class"VExport"{
		    	metamethod"_init"
		    	:body(function(self)
		    	end);
		
		    	metamethod"__call"
		    	:body(function(self)
		    	end);
		};
	}
}