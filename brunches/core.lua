namespace"trit"{
	namespace"VModeler"{
		class"BaseVModel"{
				field"strName"
				:init("");
				
				field"tabVal"
				:init({});
				
				field"tabBody"
				:init({});
				
				field"tabLua"
				:init({});
				
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
		    	:body(function(self)
		    	end);
		
		    	metamethod"__call"
		    	:body(function(self)
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