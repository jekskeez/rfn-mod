package §_-Fu§
{
   import §_-B1G§.ScrollPane;
   import §_-X1k§.NuttyPassManager;
   import §_-X1k§.§_-C2b§;
   import §_-X1k§.§_-z9§;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.text.TextFormat;
   
   public class §_-8b§ extends Sprite
   {
      
      private static const §_-a1P§:int = 5;
      
      private static const §_-P2p§:int = 310;
      
      private static const §_-15§:int = §_-4y§.WIDTH;
      
      private static const §_-hW§:int = §_-4y§.§_-i2u§;
      
      private var §_-s1q§:int = 0;
      
      private var content:Sprite;
      
      private var §_-W18§:ScrollPane;
      
      private var §_-G2e§:DisplayObject;
      
      private var §_-n20§:§_-M2b§;
      
      private var §_-f2v§:Vector.<§_-4y§> = new Vector.<§_-4y§>(0);
      
      private var §_-h2D§:Vector.<§_-i5§> = new Vector.<§_-i5§>(0);
      
      private var §_-KZ§:Array = [];
      
      private var §_-U1E§:Array = [];
      
      private var §_-k23§:Array = [];
      
      public function §_-8b§()
      {
         super();
         this.§_-W18§ = new ScrollPane();
         this.§_-W18§.setSize(§_-15§ + 11,§_-P2p§);
         this.§_-W18§.verticalLineScrollSize = §_-hW§ + §_-a1P§;
         addChild(this.§_-W18§);
         this.content = new Sprite();
         this.§_-W18§.source = this.content;
      }
      
      public function set passType(param1:int) : void
      {
         if(this.§_-s1q§ == param1)
         {
            this.§_-iJ§();
            return;
         }
         this.§_-s1q§ = param1;
         this.§_-I2v§();
         this.§_-iJ§();
      }
      
      public function get passType() : int
      {
         return this.§_-s1q§;
      }
      
      public function §_-mq§(param1:DisplayObject) : void
      {
         this.§_-G2e§ = param1;
         var _loc2_:int = int(this.§_-f2v§.length);
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            this.§_-f2v§[_loc3_].§_-mq§(param1);
            _loc3_++;
         }
      }
      
      public function §_-iJ§() : void
      {
         var _loc1_:int = 5;
         _loc1_ = this.§_-13J§(_loc1_);
         var _loc2_:Array = NuttyPassManager.§_-U1O§(this.§_-s1q§);
         var _loc3_:Boolean = !NuttyPassManager.§_-M2X§(this.§_-s1q§);
         this.§_-bE§(_loc2_,_loc3_);
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         _loc1_ = this.§_-lO§(gls("Сезонные задания"),this.§_-KZ§,_loc1_,_loc3_,_loc4_,_loc5_);
         if(this.§_-KZ§.length > 0)
         {
            _loc4_++;
         }
         _loc5_ += this.§_-KZ§.length;
         var _loc6_:String = this.§_-s1q§ == §_-C2b§.§_-pP§ ? gls("Недельные задания") : gls("Ежедневные задания");
         _loc1_ = this.§_-lO§(_loc6_,this.§_-U1E§,_loc1_,_loc3_,_loc4_,_loc5_);
         if(this.§_-U1E§.length > 0)
         {
            _loc4_++;
         }
         _loc5_ += this.§_-U1E§.length;
         if(_loc3_)
         {
            _loc1_ = this.§_-lO§(gls("Нужен пропуск"),this.§_-k23§,_loc1_,_loc3_,_loc4_,_loc5_);
            if(this.§_-k23§.length > 0)
            {
               _loc4_++;
            }
            _loc5_ += this.§_-k23§.length;
         }
         this.§_-k2T§(this.§_-h2D§,_loc4_);
         this.§_-k2T§(this.§_-f2v§,_loc5_);
         this.§_-W18§.update();
      }
      
      private function §_-13J§(param1:int) : int
      {
         var _loc2_:Object = §_-z9§.§_-SC§(§_-z9§.§_-H2D§);
         if(Boolean(_loc2_) && _loc2_.rate > 0)
         {
            if(!this.§_-n20§)
            {
               this.§_-n20§ = new §_-M2b§(this.§_-s1q§);
               this.content.addChild(this.§_-n20§);
            }
            this.§_-n20§.§_-N2Q§ = _loc2_.rate;
            this.§_-n20§.§_-y24§(§_-z9§.§_-H2D§,_loc2_.v);
            this.§_-n20§.x = 5;
            this.§_-n20§.y = param1;
            this.§_-n20§.visible = true;
            return param1 + §_-M2b§.§_-i2u§ + 5;
         }
         if(this.§_-n20§)
         {
            this.§_-n20§.visible = false;
         }
         return param1;
      }
      
      private function §_-lO§(param1:String, param2:Array, param3:int, param4:Boolean, param5:int, param6:int) : int
      {
         var _loc10_:Object = null;
         var _loc11_:§_-4y§ = null;
         if(param2.length == 0)
         {
            return param3;
         }
         var _loc7_:§_-i5§ = this.§_-o1X§(param5);
         _loc7_.text = param1;
         _loc7_.y = param3 - 3;
         _loc7_.visible = true;
         param3 += 25;
         var _loc8_:int = int(param2.length);
         var _loc9_:int = 0;
         while(_loc9_ < _loc8_)
         {
            _loc10_ = param2[_loc9_];
            _loc11_ = this.§_-R27§(param6 + _loc9_);
            _loc11_.setData(_loc10_,_loc10_.pool == "paid" && param4,this.§_-s1q§);
            _loc11_.x = 5;
            _loc11_.y = param3;
            _loc11_.visible = true;
            param3 += §_-hW§ + §_-a1P§;
            _loc9_++;
         }
         return param3;
      }
      
      private function §_-o1X§(param1:int) : §_-i5§
      {
         var _loc2_:TextFormat = null;
         var _loc3_:§_-i5§ = null;
         while(this.§_-h2D§.length <= param1)
         {
            _loc2_ = new TextFormat(§_-i5§.§_-p1s§,16,§_-C2b§.§_-Sz§(this.§_-s1q§),true,null,null,null,null,"center");
            _loc3_ = new §_-i5§("",0,0,_loc2_,§_-15§);
            this.content.addChild(_loc3_);
            this.§_-h2D§.push(_loc3_);
         }
         return this.§_-h2D§[param1];
      }
      
      private function §_-R27§(param1:int) : §_-4y§
      {
         var _loc2_:§_-4y§ = null;
         while(this.§_-f2v§.length <= param1)
         {
            _loc2_ = new §_-4y§(this.§_-s1q§);
            _loc2_.§_-mq§(this.§_-G2e§);
            this.content.addChild(_loc2_);
            this.§_-f2v§.push(_loc2_);
         }
         return this.§_-f2v§[param1];
      }
      
      private function §_-k2T§(param1:Object, param2:int) : void
      {
         var _loc3_:int = int(param1.length);
         var _loc4_:int = param2;
         while(_loc4_ < _loc3_)
         {
            param1[_loc4_].visible = false;
            _loc4_++;
         }
      }
      
      private function §_-bE§(param1:Array, param2:Boolean) : void
      {
         this.§_-KZ§.length = 0;
         this.§_-U1E§.length = 0;
         this.§_-k23§.length = 0;
         this.§_-23t§(param1,"season",this.§_-KZ§);
         if(param2)
         {
            this.§_-23t§(param1,"free",this.§_-U1E§);
            this.§_-23t§(param1,"paid",this.§_-k23§);
         }
         else
         {
            this.§_-23t§(param1,"free",this.§_-U1E§);
            this.§_-23t§(param1,"paid",this.§_-U1E§);
         }
      }
      
      private function §_-23t§(param1:Array, param2:String, param3:Array) : void
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
      
      private function §_-I2v§() : void
      {
         while(this.content.numChildren > 0)
         {
            this.content.removeChildAt(0);
         }
         this.§_-f2v§.length = 0;
         this.§_-h2D§.length = 0;
         this.§_-n20§ = null;
      }
   }
}

