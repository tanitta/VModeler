namespace"trit"{
	namespace"vmodel"{
		class"VBasic"
		:inherits(trit.vmodeler.BaseVModel){
			metamethod"_init"
			:attributes(override)
			:body(function(self)
				self.strName = "Basic"
				self.tabBody = {
					{type = "CORE", direction = "N", angle = 0, color = 0, effect = 0, child = {
				  		{type = "CHIP", direction = "N", angle = 0, color = 0, effect = 0, child = {
				    	}};
				    	{type = "CHIP", direction = "S", angle = 0, color = 0, effect = 0, child = {
				    	}};
				    }};
				}
			end);
		};
	}
}