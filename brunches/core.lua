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
		    		self.strRaw = self.objTxtFile:GetString()
		    		
		    		self.strName = ""
		    		self.tabVal = {}
		    		self.tabBody = {}
		    		self.tabLua = {} 		    		
		    	end);
		
				method"Reload"
				:body(function(self)
		    		self.strRaw = self.objTxtFile:GetString()
					
				end);
				method"AnalyzeValueBlock"
				:body(function(self)
		    		-- h, f = string.find(self.strRaw,"Val")
		    		local h, f = string.find(self.strRaw,"{.-}")
		    		h = h + 2
		    		f = f - 1
	    			local strVal = string.sub(self.strRaw,h,f)
	    			local strValL = ""
	    			local i = 0
		    		repeat 
		    			
		    			h, f = string.find(strVal,"\n")
		    			local lEnd = f
						strValL = string.sub(strVal,1,lEnd)
		    			
		    			if strValL ~= "\t\n" then
							i = i + 1
			    			self.tabVal[i] = {}
			    			
			    			-- name
		    				h, f = string.find(strValL,"[%w-_]-%(")
			    			self.tabVal[i].name = string.sub(strValL,h,f-1)
			    			
			    			--default
		    				h, f = string.find(strValL,"default=%-?%d-.?%d-[%,%)]")
		    				if h == nil then
		    					self.tabVal[i].default = 0
		    				else
			    				self.tabVal[i].default = tonumber(string.sub(strValL,h+8,f-1))	
		    				end
			    			
			    			--min
		    				h, f = string.find(strValL,"min=%-?%d-.?%d-[%,%)]")
		    				if h == nil then
		    					self.tabVal[i].min = -9999999999999999
		    				else
			    				self.tabVal[i].min = tonumber(string.sub(strValL,h+4,f-1))
		    				end
			    			
			    			--max
		    				h, f = string.find(strValL,"max=%-?%d-.?%d-[%,%)]")
		    				if h == nil then
		    					self.tabVal[i].max = 9999999999999999
		    				else
			    				self.tabVal[i].max = tonumber(string.sub(strValL,h+4,f-1))
		    				end
			    			
			    			--step
		    				h, f = string.find(strValL,"step=%-?%d-.?%d-[%,%)]")
		    				if h == nil then
		    					self.tabVal[i].step = 0
		    				else
			    				self.tabVal[i].step = tonumber(string.sub(strValL,h+5,f-1))
		    				end
			    			
			    			--disp
		    				h, f = string.find(strValL,"disp=%-?%d-.?%d-[%,%)]")
		    				if h == nil then
		    					self.tabVal[i].disp = 0
		    				else
			    				self.tabVal[i].disp = tonumber(string.sub(strValL,h+5,f-1))
		    				end
			    			
		    			end
		    			
		    			strVal = string.sub(strVal,lEnd+1)
		    			
		    		until strVal == ""
			    
				end);
		
				method"AnalyzeBodyBlock"
				:body(function(self)
					local h,f = 0, 0
					local depth = 0
					h,f = string.find(self.strRaw,"Body\n{.*}\nLua")
					local strBody = string.sub(self.strRaw,h+7,f-5)
					-- out(0,strBody)
					local block = function() end
				end);
			
		    	method"GenerateData"
		    	:body(function(self)
		    		self:AnalyzeValueBlock()
		    		self:AnalyzeBodyBlock()
		    		
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