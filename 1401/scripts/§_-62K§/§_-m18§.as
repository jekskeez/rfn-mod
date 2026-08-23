package §_-62K§
{
   import §_-I10§.NuttyPassManager;
   import §_-I10§.§_-K1X§;
   import §_-I10§.§_-a1D§;
   import §_-Kr§.ScrollPane;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.text.TextFormat;
   
   public class §_-m18§ extends Sprite
   {
      
      private static const §_-j2B§:int = 5;
      
      private static const §_-01e§:int = 310;
      
      private static const §_-11r§:int = §_-D22§.WIDTH;
      
      private static const §_-Fh§:int = §_-D22§.§_-kI§;
      
      private var §_-mb§:int = 0;
      
      private var content:Sprite;
      
      private var §_-M1N§:ScrollPane;
      
      private var §_-J2l§:DisplayObject;
      
      private var §_-Io§:§_-x1u§;
      
      private var §_-QB§:Vector.<§_-D22§> = new Vector.<§_-D22§>(0);
      
      private var §_-a2E§:Vector.<§_-22V§> = new Vector.<§_-22V§>(0);
      
      private var §_-21h§:Array = [];
      
      private var §_-63F§:Array = [];
      
      private var §_-42C§:Array = [];
      
      public function §_-m18§()
      {
         super();
         this.§_-M1N§ = new ScrollPane();
         this.§_-M1N§.setSize(§_-11r§ + 11,§_-01e§);
         this.§_-M1N§.verticalLineScrollSize = §_-Fh§ + §_-j2B§;
         addChild(this.§_-M1N§);
         this.content = new Sprite();
         this.§_-M1N§.source = this.content;
      }
      
      public function set passType(param1:int) : void
      {
         if(this.§_-mb§ == param1)
         {
            this.§_-f19§();
            return;
         }
         this.§_-mb§ = param1;
         this.§_-A31§();
         this.§_-f19§();
      }
      
      public function get passType() : int
      {
         return this.§_-mb§;
      }
      
      public function §_-t21§(param1:DisplayObject) : void
      {
         this.§_-J2l§ = param1;
         var _loc2_:int = int(this.§_-QB§.length);
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            this.§_-QB§[_loc3_].§_-t21§(param1);
            _loc3_++;
         }
      }
      
      public function §_-f19§() : void
      {
         var _loc1_:int = 5;
         _loc1_ = this.§_-Q1D§(_loc1_);
         var _loc2_:Array = NuttyPassManager.§_-o20§(this.§_-mb§);
         var _loc3_:Boolean = !NuttyPassManager.§_-pU§(this.§_-mb§);
         this.§_-j1X§(_loc2_,_loc3_);
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         _loc1_ = this.§_-B2R§(gls("Сезонные задания"),this.§_-21h§,_loc1_,_loc3_,_loc4_,_loc5_);
         if(this.§_-21h§.length > 0)
         {
            _loc4_++;
         }
         _loc5_ += this.§_-21h§.length;
         var _loc6_:String = this.§_-mb§ == §_-a1D§.§_-81j§ ? gls("Недельные задания") : gls("Ежедневные задания");
         _loc1_ = this.§_-B2R§(_loc6_,this.§_-63F§,_loc1_,_loc3_,_loc4_,_loc5_);
         if(this.§_-63F§.length > 0)
         {
            _loc4_++;
         }
         _loc5_ += this.§_-63F§.length;
         if(_loc3_)
         {
            _loc1_ = this.§_-B2R§(gls("Нужен пропуск"),this.§_-42C§,_loc1_,_loc3_,_loc4_,_loc5_);
            if(this.§_-42C§.length > 0)
            {
               _loc4_++;
            }
            _loc5_ += this.§_-42C§.length;
         }
         this.§_-zn§(this.§_-a2E§,_loc4_);
         this.§_-zn§(this.§_-QB§,_loc5_);
         this.§_-M1N§.update();
      }
      
      private function §_-Q1D§(param1:int) : int
      {
         var _loc2_:Object = §_-K1X§.§_-e1K§(§_-K1X§.§_-822§);
         if(Boolean(_loc2_) && _loc2_.rate > 0)
         {
            if(!this.§_-Io§)
            {
               this.§_-Io§ = new §_-x1u§(this.§_-mb§);
               this.content.addChild(this.§_-Io§);
            }
            this.§_-Io§.§_-y1s§ = _loc2_.rate;
            this.§_-Io§.§_-L2c§(§_-K1X§.§_-822§,_loc2_.v);
            this.§_-Io§.x = 5;
            this.§_-Io§.y = param1;
            this.§_-Io§.visible = true;
            return param1 + §_-x1u§.§_-kI§ + 5;
         }
         if(this.§_-Io§)
         {
            this.§_-Io§.visible = false;
         }
         return param1;
      }
      
      private function §_-B2R§(param1:String, param2:Array, param3:int, param4:Boolean, param5:int, param6:int) : int
      {
         var _loc10_:Object = null;
         var _loc11_:§_-D22§ = null;
         if(param2.length == 0)
         {
            return param3;
         }
         var _loc7_:§_-22V§ = this.§_-B29§(param5);
         _loc7_.text = param1;
         _loc7_.y = param3 - 3;
         _loc7_.visible = true;
         param3 += 25;
         var _loc8_:int = int(param2.length);
         var _loc9_:int = 0;
         while(_loc9_ < _loc8_)
         {
            _loc10_ = param2[_loc9_];
            _loc11_ = this.§_-m2B§(param6 + _loc9_);
            _loc11_.setData(_loc10_,_loc10_.pool == "paid" && param4,this.§_-mb§);
            _loc11_.x = 5;
            _loc11_.y = param3;
            _loc11_.visible = true;
            param3 += §_-Fh§ + §_-j2B§;
            _loc9_++;
         }
         return param3;
      }
      
      private function §_-B29§(param1:int) : §_-22V§
      {
         var _loc2_:TextFormat = null;
         var _loc3_:§_-22V§ = null;
         while(this.§_-a2E§.length <= param1)
         {
            _loc2_ = new TextFormat(§_-22V§.§_-pJ§,16,§_-a1D§.§_-DG§(this.§_-mb§),true,null,null,null,null,"center");
            _loc3_ = new §_-22V§("",0,0,_loc2_,§_-11r§);
            this.content.addChild(_loc3_);
            this.§_-a2E§.push(_loc3_);
         }
         return this.§_-a2E§[param1];
      }
      
      private function §_-m2B§(param1:int) : §_-D22§
      {
         var _loc2_:§_-D22§ = null;
         while(this.§_-QB§.length <= param1)
         {
            _loc2_ = new §_-D22§(this.§_-mb§);
            _loc2_.§_-t21§(this.§_-J2l§);
            this.content.addChild(_loc2_);
            this.§_-QB§.push(_loc2_);
         }
         return this.§_-QB§[param1];
      }
      
      private function §_-zn§(param1:Object, param2:int) : void
      {
         var _loc3_:int = int(param1.length);
         var _loc4_:int = param2;
         while(_loc4_ < _loc3_)
         {
            param1[_loc4_].visible = false;
            _loc4_++;
         }
      }
      
      private function §_-j1X§(param1:Array, param2:Boolean) : void
      {
         this.§_-21h§.length = 0;
         this.§_-63F§.length = 0;
         this.§_-42C§.length = 0;
         this.§_-Y1j§(param1,"season",this.§_-21h§);
         if(param2)
         {
            this.§_-Y1j§(param1,"free",this.§_-63F§);
            this.§_-Y1j§(param1,"paid",this.§_-42C§);
         }
         else
         {
            this.§_-Y1j§(param1,"free",this.§_-63F§);
            this.§_-Y1j§(param1,"paid",this.§_-63F§);
         }
      }
      
      private function §_-Y1j§(param1:Array, param2:String, param3:Array) : void
      {
         var _loc5_:int = 0;
         var _loc6_:Object = null;
         var _loc4_:int = int(param1.length);
         _loc5_ = 0;
         while(_loc5_ < _loc4_)
         {
            _loc6_ = param1[_loc5_];
            if(_loc6_.pool == param2 && !_loc6_.completed)
            {
               param3.push(_loc6_);
            }
            _loc5_++;
         }
         _loc5_ = 0;
         while(_loc5_ < _loc4_)
         {
            _loc6_ = param1[_loc5_];
            if(_loc6_.pool == param2 && Boolean(_loc6_.completed))
            {
               param3.push(_loc6_);
            }
            _loc5_++;
         }
      }
      
      private function §_-A31§() : void
      {
         while(this.content.numChildren > 0)
         {
            this.content.removeChildAt(0);
         }
         this.§_-QB§.length = 0;
         this.§_-a2E§.length = 0;
         this.§_-Io§ = null;
      }
   }
}

